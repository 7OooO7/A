import fs from 'fs';
import path from 'path';

const LINKS_DIR = path.join(process.cwd(), 'data');

function normalizePath(p) {
  let n = p.trim();
  if (!n.startsWith('/')) n = '/' + n;
  if (n.length > 1 && n.endsWith('/')) n = n.slice(0, -1);
  return n;
}

function loadAllLinkFiles() {
  const files = fs
    .readdirSync(LINKS_DIR)
    .filter((f) => f.startsWith('internal-links-') && f.endsWith('.json'));
  return files.map((file) => {
    const content = fs.readFileSync(path.join(LINKS_DIR, file), 'utf-8');
    return JSON.parse(content);
  });
}

function getInternalLinks(locale, pagePath) {
  const allFiles = loadAllLinkFiles();
  const allSettings = [];
  const allKeywords = new Map();
  const allDoNotLink = [];
  let pageConfig = null;
  const normalizedPagePath = normalizePath(pagePath);

  for (const file of allFiles) {
    allSettings.push(file.settings);
    allDoNotLink.push(...(file.doNotLink || []));
    for (const kw of file.keywords || []) {
      if (!allKeywords.has(kw.id)) allKeywords.set(kw.id, kw);
    }
    for (const [p, config] of Object.entries(file.pages || {})) {
      if (normalizePath(p) === normalizedPagePath) {
        pageConfig = config;
        break;
      }
    }
  }

  if (!pageConfig) return [];

  const settings = {
    maxLinksPerPage: Math.min(...allSettings.map((s) => s.maxLinksPerPage)),
    excludeSelfLinks: allSettings.some((s) => s.excludeSelfLinks),
    linkFirstOccurrenceOnly: allSettings.some((s) => s.linkFirstOccurrenceOnly),
    skipHeadings: allSettings.some((s) => s.skipHeadings),
    minParagraphLength: Math.max(...allSettings.map((s) => s.minParagraphLength)),
  };

  const doNotLinkSet = new Set(allDoNotLink.map((w) => w.toLowerCase()));
  const resolved = [];
  const seenTargets = new Set();

  for (const keywordId of pageConfig.applyKeywords) {
    if (resolved.length >= settings.maxLinksPerPage) break;
    const kw = allKeywords.get(keywordId);
    if (!kw || !kw.enabled) continue;
    if (settings.excludeSelfLinks && normalizePath(kw.targetUrl) === normalizedPagePath) continue;
    if (seenTargets.has(kw.targetUrl)) continue;
    seenTargets.add(kw.targetUrl);
    const termInLocale = kw.term[locale];
    if (!termInLocale) continue;
    if (doNotLinkSet.has(termInLocale.toLowerCase())) continue;
    resolved.push({
      keyword: termInLocale,
      targetUrl: kw.targetUrl,
      keywordId: kw.id,
    });
  }
  return resolved;
}

// ====== اختبار ======
console.log('\n--- /power-of-attorney (EN) ---');
console.log(getInternalLinks('en', '/power-of-attorney'));

console.log('\n--- /power-of-attorney (AR) ---');
console.log(getInternalLinks('ar', '/power-of-attorney'));

console.log('\n--- /power-of-attorney/general (EN) ---');
console.log(getInternalLinks('en', '/power-of-attorney/general'));

console.log('\n--- /corporate/moa (EN) ---');
console.log(getInternalLinks('en', '/corporate/moa'));