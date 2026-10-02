import { NextResponse, type NextRequest } from 'next/server'
import { LANGS } from '@/lib/i18n'

// ─────────────────────────────────────────────────────────────────────────────
// E-Notary Dubai — Edge Middleware
//
// Responsibilities:
//   1. Automatic language detection (Accept-Language + cookie preference)
//   2. Rate limiting — block aggressive scrapers / content-harvesters
//   3. Bot user-agent filtering — block known scraping tools at the door
//   4. Defense-in-depth path blocking for /data/* and config-like paths
//   5. Pass-through for legitimate traffic (SEO bots explicitly allowed)
//
// Runs on Vercel's Edge runtime (very fast, very cheap, global).
// ─────────────────────────────────────────────────────────────────────────────

// ── Language detection ──────────────────────────────────────────────────────
const DEFAULT_LANG = 'en'
const LANG_COOKIE = 'preferred-lang'
const LANG_COOKIE_MAX_AGE = 60 * 60 * 24 * 365 // 1 year

/**
 * Picks the best supported language from an Accept-Language header.
 * Example: "ar-AE,ar;q=0.9,en-US;q=0.8,en;q=0.7" → "ar"
 */
function detectLanguage(acceptLang: string): string {
  if (!acceptLang) return DEFAULT_LANG

  const langs = acceptLang
    .split(',')
    .map((part) => {
      const [code, q] = part.trim().split(';q=')
      return {
        code: code.trim().toLowerCase(),
        quality: q ? parseFloat(q) : 1,
      }
    })
    .sort((a, b) => b.quality - a.quality)

  for (const { code } of langs) {
    // ar-AE → ar ، en-US → en ، zh-Hans-CN → zh
    const base = code.split('-')[0]
    if ((LANGS as readonly string[]).includes(base)) {
      return base
    }
  }
  return DEFAULT_LANG
}

/**
 * Returns true if the pathname already starts with a supported language code.
 */
function hasLangPrefix(pathname: string): boolean {
  return (LANGS as readonly string[]).some(
    (lang) => pathname === `/${lang}` || pathname.startsWith(`/${lang}/`)
  )
}

// ── Rate limiter (in-memory, per edge instance) ─────────────────────────────
// Note: Vercel's edge is distributed, so this is a per-POP limiter. It's
// intentionally generous — enough to let real users browse freely but to
// catch scrapers hammering one POP. For global strict limits, upgrade to
// Upstash Redis later; this is a strong baseline with zero infra cost.

interface RateRecord {
  count: number
  resetAt: number
}

const RATE_WINDOW_MS = 60_000 // 1 minute
const RATE_MAX_REQUESTS = 120 // 120 req/min per IP = 2 req/sec sustained
const rateStore = new Map<string, RateRecord>()

// Cleanup old records every ~500 requests to prevent memory bloat
let cleanupCounter = 0
function maybeCleanup(now: number) {
  cleanupCounter++
  if (cleanupCounter < 500) return
  cleanupCounter = 0
  // Array.from avoids requiring --downlevelIteration for Map iterators
  for (const [key, rec] of Array.from(rateStore.entries())) {
    if (rec.resetAt < now) rateStore.delete(key)
  }
}

function getClientIp(req: NextRequest): string {
  // Vercel sets x-forwarded-for; first IP is the real client
  const fwd = req.headers.get('x-forwarded-for')
  if (fwd) return fwd.split(',')[0].trim()
  const real = req.headers.get('x-real-ip')
  if (real) return real
  return 'unknown'
}

function checkRateLimit(ip: string): { allowed: boolean; remaining: number } {
  const now = Date.now()
  maybeCleanup(now)
  const rec = rateStore.get(ip)
  if (!rec || rec.resetAt < now) {
    rateStore.set(ip, { count: 1, resetAt: now + RATE_WINDOW_MS })
    return { allowed: true, remaining: RATE_MAX_REQUESTS - 1 }
  }
  rec.count++
  if (rec.count > RATE_MAX_REQUESTS) {
    return { allowed: false, remaining: 0 }
  }
  return { allowed: true, remaining: RATE_MAX_REQUESTS - rec.count }
}

// ── Bot filter ───────────────────────────────────────────────────────────────
// Deny-list of known scraping/harvesting tools. We allow legitimate SEO bots
// (Googlebot, Bingbot, etc) because they're essential for ranking.

const BLOCKED_UA_PATTERNS = [
  /scrapy/i,
  /httrack/i,
  /wget/i,
  /curl/i,
  /python-requests/i,
  /python-urllib/i,
  /go-http-client/i,
  /java\//i,
  /okhttp/i,
  /libwww-perl/i,
  /phantomjs/i,
  /headlesschrome/i,
  /puppeteer/i,
  /playwright/i,
  /selenium/i,
  /ahrefsbot/i,
  /semrushbot/i,
  /mj12bot/i,
  /dotbot/i,
  /petalbot/i,
  /blexbot/i,
  /seznambot/i,
  /serpstatbot/i,
]

// Explicitly allowed bots (whitelist wins over any match above)
const ALLOWED_UA_PATTERNS = [
  /googlebot/i,
  /bingbot/i,
  /slurp/i, // Yahoo
  /duckduckbot/i,
  /baiduspider/i,
  /yandex/i,
  /facebookexternalhit/i,
  /twitterbot/i,
  /linkedinbot/i,
  /whatsapp/i,
  /telegrambot/i,
  /applebot/i,
  // Answer-engine / AI crawlers — allowed past the scraper deny-list.
  // This list affects the BOT FILTER ONLY. It grants no rate-limit privilege.
  /OAI-SearchBot/i,
  /PerplexityBot/i,
  /Perplexity-User/i,
  /Claude-SearchBot/i,
  /Claude-User/i,
]

function isBlockedBot(userAgent: string): boolean {
  if (!userAgent) return false
  if (ALLOWED_UA_PATTERNS.some((re) => re.test(userAgent))) return false
  return BLOCKED_UA_PATTERNS.some((re) => re.test(userAgent))
}

// ── Path firewall ────────────────────────────────────────────────────────────
// Explicitly reject any request that tries to reach source data or config.
// These paths don't exist on the server, but rejecting them at the edge
// gives a cleaner signal and prevents reconnaissance.

const BLOCKED_PATH_PATTERNS = [
  /^\/data(\/|$)/i,
  /^\/lib(\/|$)/i,
  /^\/\.env/i,
  /^\/\.git/i,
  /^\/package\.json$/i,
  /^\/next\.config/i,
  /^\/tsconfig/i,
  /\.map$/i, // block any .map file access attempt
]

const SAFE_METHODS = new Set(['GET', 'HEAD'])

// The in-memory limiter applies to API routes and to any non-safe method.
// It is never enabled or disabled on the basis of the User-Agent header.
function needsRateLimit(req: NextRequest, pathname: string): boolean {
  if (pathname.startsWith('/api/')) return true
  return !SAFE_METHODS.has(req.method)
}

function isBlockedPath(pathname: string): boolean {
  return BLOCKED_PATH_PATTERNS.some((re) => re.test(pathname))
}

// ── Language redirect handler ────────────────────────────────────────────────
// Only runs after security checks pass. Handles two cases:
//   1. Path has no language prefix → detect and redirect (e.g. `/` → `/ar/`)
//   2. Path has a language prefix   → save the preference to a cookie
function handleLanguage(req: NextRequest, pathname: string): NextResponse | null {
  const hasPrefix = hasLangPrefix(pathname)

  // Case A: path already has a language — save it to cookie and pass through
  if (hasPrefix) {
    const currentLang = pathname.split('/')[1]
    const res = NextResponse.next()
    res.cookies.set(LANG_COOKIE, currentLang, {
      maxAge: LANG_COOKIE_MAX_AGE,
      path: '/',
      sameSite: 'lax',
    })
    return res
  }

  // Case B: no language prefix — determine target language
  // 1. User's saved preference (cookie) wins
  const cookieLang = req.cookies.get(LANG_COOKIE)?.value
  const targetLang =
    cookieLang && (LANGS as readonly string[]).includes(cookieLang)
      ? cookieLang
      // 2. Otherwise, detect from Accept-Language header
      : detectLanguage(req.headers.get('accept-language') || '')

  // Redirect preserving the rest of the path + query string
  const url = req.nextUrl.clone()
  url.pathname = `/${targetLang}${pathname === '/' ? '' : pathname}`
  return NextResponse.redirect(url)
}

// ── Main middleware ──────────────────────────────────────────────────────────

export function middleware(req: NextRequest) {
  const { pathname } = req.nextUrl

  // 1. Path firewall — immediate 404 for sensitive paths
  if (isBlockedPath(pathname)) {
    return new NextResponse('Not Found', { status: 404 })
  }

  // 2. Bot filter — block known scrapers
  const ua = req.headers.get('user-agent') || ''
  if (isBlockedBot(ua)) {
    return new NextResponse('Forbidden', { status: 403 })
  }

  // 3. Rate limiting — scoped, never granted or waived by User-Agent.
  //    Ordinary public page reads (GET/HEAD outside /api) skip the in-memory
  //    limiter entirely: it cannot protect a CDN-cached static route and only
  //    penalised shared-IP visitors. Everything else stays limited.
  if (needsRateLimit(req, pathname)) {
    const ip = getClientIp(req)
    const { allowed, remaining } = checkRateLimit(ip)
    if (!allowed) {
      return new NextResponse('Too Many Requests', {
        status: 429,
        headers: {
          'Retry-After': '60',
          'X-RateLimit-Limit': String(RATE_MAX_REQUESTS),
          'X-RateLimit-Remaining': '0',
        },
      })
    }
    const limited = NextResponse.next()
    limited.headers.set('X-RateLimit-Limit', String(RATE_MAX_REQUESTS))
    limited.headers.set('X-RateLimit-Remaining', String(remaining))
    return limited
  }

  // 4. Language detection + redirect (runs after security checks pass)
  //    Only for GET/HEAD requests — never for API calls or non-safe methods,
  //    so we never break form submissions or webhooks.
  if (SAFE_METHODS.has(req.method)) {
    const langResponse = handleLanguage(req, pathname)
    if (langResponse) return langResponse
  }

  return NextResponse.next()
}

// Matcher: run middleware on everything EXCEPT:
//   - Next.js internals (_next/*)
//   - static assets folder
//   - favicon, robots, sitemap
export const config = {
  matcher: [
    '/((?!_next/static|_next/image|assets|favicon.ico|robots.txt|sitemap.xml).*)',
  ],
}