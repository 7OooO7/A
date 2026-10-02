/** @type {import('next').NextConfig} */

// ─────────────────────────────────────────────────────────────────────────────
// E-Notary Dubai — Hardened Next.js Config
// Zero-Trust Security Protocol
// ─────────────────────────────────────────────────────────────────────────────

// Content Security Policy
// Strategy: Static-generation-compatible CSP via HTTP header.
// - Strict restrictions on object, base, frame-ancestors, form-action, connect.
// - script-src allows self + GTM + 'unsafe-inline' required for inline JSON-LD
//   (SEO structured data) and the GA bootstrap snippet. React auto-escapes all
//   user/content output, neutralizing the main XSS vector.
// - No 'unsafe-eval' anywhere.
const ContentSecurityPolicy = [
  "default-src 'self'",
  "script-src 'self' 'unsafe-inline' https://www.googletagmanager.com https://www.google-analytics.com",
  "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com",
  "img-src 'self' data: blob: https://www.google-analytics.com https://www.googletagmanager.com",
  "font-src 'self' https://fonts.gstatic.com data:",
  "connect-src 'self' https://www.google-analytics.com https://www.googletagmanager.com https://region1.google-analytics.com",
  "frame-src 'self' https://www.google.com",
  "frame-ancestors 'self'",
  "form-action 'self'",
  "base-uri 'self'",
  "object-src 'none'",
  "worker-src 'self' blob:",
  "manifest-src 'self'",
  "upgrade-insecure-requests",
].join('; ')

const securityHeaders = [
  // Hide framework fingerprint (also see poweredByHeader: false below)
  { key: 'X-DNS-Prefetch-Control', value: 'on' },
  // HSTS: force HTTPS for 2 years, include subdomains, eligible for preload list
  {
    key: 'Strict-Transport-Security',
    value: 'max-age=63072000; includeSubDomains; preload',
  },
  // Clickjacking protection (legacy header; CSP frame-ancestors is modern equivalent)
  { key: 'X-Frame-Options', value: 'SAMEORIGIN' },
  // MIME-sniffing protection
  { key: 'X-Content-Type-Options', value: 'nosniff' },
  // Referrer leakage control
  { key: 'Referrer-Policy', value: 'strict-origin-when-cross-origin' },
  // Legacy XSS filter (deprecated in modern browsers but harmless)
  { key: 'X-XSS-Protection', value: '1; mode=block' },
  // Disable powerful browser features we don't use
  {
    key: 'Permissions-Policy',
    value: 'camera=(), microphone=(), geolocation=(), interest-cohort=(), payment=(), usb=(), magnetometer=(), gyroscope=(), accelerometer=()',
  },
  // Isolation headers
  { key: 'Cross-Origin-Opener-Policy', value: 'same-origin' },
  { key: 'Cross-Origin-Resource-Policy', value: 'same-origin' },
  // Content Security Policy
  { key: 'Content-Security-Policy', value: ContentSecurityPolicy },
]

const nextConfig = {
  // Hide 'X-Powered-By: Next.js' technical fingerprint
  poweredByHeader: false,

  // Disable production source maps so competitors cannot read component
  // structure via browser DevTools
  productionBrowserSourceMaps: false,

  // Strict React mode
  reactStrictMode: true,

  // typescript.ignoreBuildErrors removed 2026-09-10: `tsc --noEmit` is clean,
  // so any new type error must break the build instead of being hidden.
  eslint: {
    ignoreDuringBuilds: true,
  },

  // Remove all console.* calls in production builds (prevents info leakage
  // via DevTools console). Keep console.error for critical failures.
  compiler: {
    removeConsole: process.env.NODE_ENV === 'production' ? { exclude: ['error'] } : false,
  },

  trailingSlash: true,
  images: {
    unoptimized: true,
  },

  async redirects() {
    return [
      // ❌ REMOVED 2026-10-03: `'/' → '/en/'` rule.
      // Reason: it forced every visitor to English and prevented the
      // middleware from detecting the visitor's preferred language.
      // The middleware now handles `'/'` → `'/<detected-lang>/'` per visitor.
      // SEO note: Googlebot sends `Accept-Language: en-US` and will land on
      // `/en/` as before, so ranking for the English canonical is unchanged.

      // 301 permanent: /attestation/apostille → /attestation/mofa (UAE is not a Hague member)
      {
        source: '/:lang(en|ar|ru|zh|es)/attestation/apostille',
        destination: '/:lang/attestation/mofa/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/attestation/apostille/',
        destination: '/:lang/attestation/mofa/',
        permanent: true,
      },
      // 301 permanent: consolidate thin/overlapping MOFA blog URLs into the evergreen master guide.
      {
        source: '/:lang(en|ar|ru|zh|es)/blog/:slug(mofa-attestation-step-by-step-dubai|mofa-attestation-uae-complete-guide-2026)',
        destination: '/:lang/blog/mofa-attestation-guide/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/blog/:slug(mofa-attestation-step-by-step-dubai|mofa-attestation-uae-complete-guide-2026)/',
        destination: '/:lang/blog/mofa-attestation-guide/',
        permanent: true,
      },
      // 301 permanent: consolidate the duplicate eviction guide into the Article 25 master.
      {
        source: '/:lang(en|ar|ru|zh|es)/blog/eviction-notice-dubai-guide',
        destination: '/:lang/blog/eviction-notice-requirements-dubai/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/blog/eviction-notice-dubai-guide/',
        destination: '/:lang/blog/eviction-notice-requirements-dubai/',
        permanent: true,
      },
      // 301 permanent: retire thin/overlapping blog URLs into their canonical service pages.
      {
        source: '/:lang(en|ar|ru|zh|es)/blog/poa-rejected-by-authority-what-to-do',
        destination: '/:lang/why-poa-rejected-dubai/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/blog/poa-rejected-by-authority-what-to-do/',
        destination: '/:lang/why-poa-rejected-dubai/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/blog/dld-property-gift-transfer-dubai',
        destination: '/:lang/power-of-attorney/property-gifting/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/blog/dld-property-gift-transfer-dubai/',
        destination: '/:lang/power-of-attorney/property-gifting/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/blog/power-of-attorney-property-sale-dubai',
        destination: '/:lang/power-of-attorney/real-estate/sale/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/blog/power-of-attorney-property-sale-dubai/',
        destination: '/:lang/power-of-attorney/real-estate/sale/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/blog/same-day-notary-dubai',
        destination: '/:lang/emergency-notary/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/blog/same-day-notary-dubai/',
        destination: '/:lang/emergency-notary/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/blog/legal-translation-dubai-guide',
        destination: '/:lang/legal-translation/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/blog/legal-translation-dubai-guide/',
        destination: '/:lang/legal-translation/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/blog/how-to-cancel-poa-dubai',
        destination: '/:lang/poa-cancellation/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/blog/how-to-cancel-poa-dubai/',
        destination: '/:lang/poa-cancellation/',
        permanent: true,
      },
      // 301 permanent: deleted apostille blog articles → MOFA attestation guide
      {
        source: '/:lang(en|ar|ru|zh|es)/blog/:slug(what-is-apostille-uae|apostille-vs-embassy-attestation-uae-guide|apostille-vs-attestation)',
        destination: '/:lang/blog/mofa-attestation-guide/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/blog/:slug(what-is-apostille-uae|apostille-vs-embassy-attestation-uae-guide|apostille-vs-attestation)/',
        destination: '/:lang/blog/mofa-attestation-guide/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/power-of-attorney/marriage',
        destination: '/:lang/power-of-attorney/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/power-of-attorney/marriage/',
        destination: '/:lang/power-of-attorney/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/power-of-attorney/divorce',
        destination: '/:lang/power-of-attorney/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/power-of-attorney/divorce/',
        destination: '/:lang/power-of-attorney/',
        permanent: true,
      },
      // 301 permanent: /eviction-notice → /legal-notice/eviction
      // Preserves the visitor's language when a lang prefix is present.
      {
        source: '/:lang(en|ar|ru|zh|es)/eviction-notice',
        destination: '/:lang/legal-notice/eviction/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/eviction-notice/',
        destination: '/:lang/legal-notice/eviction/',
        permanent: true,
      },
      // Bare (un-prefixed) variants — fall back to the default language.
      {
        source: '/eviction-notice',
        destination: '/en/legal-notice/eviction/',
        permanent: true,
      },
      {
        source: '/:lang(en|ar|ru|zh|es)/corporate/meeting-minutes/',
        destination: '/:lang/corporate/board-resolution/',
        permanent: true,
      },
      {
        source: '/eviction-notice/',
        destination: '/en/legal-notice/eviction/',
        permanent: true,
      },

      // ❌ REMOVED 2026-10-03: catch-all rules that forced un-prefixed paths
      // to `/en/...`:
      //   source: '/:path((?!en|ar|ru|zh|es|_next|assets|api)[^/.]+)' → '/en/:path/'
      //   source: '/:path((?!en|ar|ru|zh|es|_next|assets|api)[^/]+)/:rest+' → '/en/:path/:rest+/'
      // Reason: they prevented per-visitor language detection on any
      // un-prefixed path. The middleware now handles this:
      //   `/about`  → `/ar/about/`  (for an Arabic visitor)
      //   `/about`  → `/en/about/`  (for an English visitor)
      // SEO note: Googlebot sends `Accept-Language: en-US` and continues to
      // be served the English canonical, exactly as before.
    ]
  },

  async headers() {
    return [
      {
        source: '/:path*',
        headers: securityHeaders,
      },
      {
        source: '/assets/:path*',
        headers: [
          { key: 'Cache-Control', value: 'public, max-age=31536000, immutable' },
        ],
      },
    ]
  },

  // Defense-in-depth: block any HTTP request that tries to reach the raw
  // content.json or the entire /data/ folder via URL. Next.js already hides
  // these files (they are never copied to /public and only imported at build
  // time), but this is an explicit firewall in case of future mistakes.
  async rewrites() {
    return {
      beforeFiles: [
        {
          source: '/data/:path*',
          destination: '/404',
        },
        {
          source: '/data',
          destination: '/404',
        },
      ],
      afterFiles: [],
      fallback: [],
    }
  },
}

export default nextConfig