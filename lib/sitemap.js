import { CODES, DOMAIN } from './i18n';
import { getEnabledServiceSlugs, isServiceEnabled } from './serviceAvailability';
import { languageAlternates, reviewedLanguageAlternates } from './seo';
import { APOSTILLE_DESTINATIONS } from './apostille';
import { isSearchReady } from './editorial';
import { getArticles, getArticleAlternates } from './blog';
import { getBlogPageCount, getBlogPageInfo, blogPagePath, getBlogPageAlternates } from './blog-pagination';

export function getLanguageSitemap(lang) {
  const out = [];
  if (!CODES.includes(lang) || !isSearchReady(lang)) return out;
    out.push({ url:`${DOMAIN}/${lang}`, alternates:{languages:languageAlternates('')} });
    out.push({ url:`${DOMAIN}/${lang}/about`, alternates:{languages:languageAlternates('/about')} });
    out.push({ url:`${DOMAIN}/${lang}/contact`, alternates:{languages:languageAlternates('/contact')} });
    if (["en", "ar", "sv", "de", "fr", "es", "it", "nl", "da", "no", "fi", "pt", "pl", "cs", "sk", "ro", "hu", "bg", "el", "et", "hr", "ru", "lt", "lv", "is", "mt", "sl", "tr", "ga", "sr", "uk", "sq"].includes(lang)) for (const slug of ['privacy','terms','refunds','how-it-works','pricing','document-requirements','document-rejection']) out.push({url:`${DOMAIN}/${lang}/${slug}`,alternates:{languages:Object.fromEntries(["en", "ar", "sv", "de", "fr", "es", "it", "nl", "da", "no", "fi", "pt", "pl", "cs", "sk", "ro", "hu", "bg", "el", "et", "hr", "ru", "lt", "lv", "is", "mt", "sl", "tr", "ga", "sr", "uk", "sq"].map(code=>[code,`${DOMAIN}/${code}/${slug}`]))}});
    out.push({ url:`${DOMAIN}/${lang}/faq`, alternates:{languages:languageAlternates('/faq')} });
    if (isSearchReady(lang)) for (const slug of getEnabledServiceSlugs()) out.push({ url:`${DOMAIN}/${lang}/services/${slug}`, alternates:{languages:reviewedLanguageAlternates(`/services/${slug}`)} });
    if (lang === 'en' && isServiceEnabled('apostille')) for (const d of APOSTILLE_DESTINATIONS) out.push({ url:`${DOMAIN}/${lang}/apostille/${d.slug}` });
    const posts = getArticles(lang);
    for (let page=1;page<=getBlogPageCount(lang);page++) {
      const pagePosts=getBlogPageInfo(lang,page).posts;
      out.push({url:`${DOMAIN}${blogPagePath(lang,page)}`,lastModified:pagePosts.reduce((latest,post)=>post.updatedAt>latest?post.updatedAt:latest,pagePosts[0].updatedAt),alternates:{languages:getBlogPageAlternates(page)}});
    }
    for (const post of posts) out.push({ url:`${DOMAIN}/${lang}/blog/${post.slug}`, lastModified:post.updatedAt, alternates:{languages:getArticleAlternates(post.slug,DOMAIN)} });
  return out;
}

export const getSitemapLanguages = () => CODES.filter(isSearchReady);
const xmlEscape = value => String(value).replace(/[&<>"']/g, char => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&apos;'}[char]));
export function sitemapIndexXml() {
  return '<?xml version="1.0" encoding="UTF-8"?>\n<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n'
    + getSitemapLanguages().map(lang => `<sitemap><loc>${xmlEscape(`${DOMAIN}/${lang}/sitemap.xml`)}</loc></sitemap>`).join('\n')
    + '\n</sitemapindex>\n';
}
export function languageSitemapXml(lang) {
  const entries = getLanguageSitemap(lang).map(entry => {
    const fields = [`<loc>${xmlEscape(entry.url)}</loc>`];
    for (const [code, href] of Object.entries(entry.alternates?.languages || {})) {
      fields.push(`<xhtml:link rel="alternate" hreflang="${xmlEscape(code)}" href="${xmlEscape(href)}" />`);
    }
    if (entry.lastModified) fields.push(`<lastmod>${xmlEscape(entry.lastModified instanceof Date ? entry.lastModified.toISOString() : entry.lastModified)}</lastmod>`);
    return `<url>${fields.join('')}</url>`;
  });
  return '<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xhtml="http://www.w3.org/1999/xhtml">\n'
    + entries.join('\n') + '\n</urlset>\n';
}
