import { CODES, DOMAIN } from '../lib/i18n';
import { getEnabledServiceSlugs, isServiceEnabled } from '../lib/serviceAvailability';
import { languageAlternates, reviewedLanguageAlternates } from '../lib/seo';
import { APOSTILLE_DESTINATIONS } from '../lib/apostille';
import { isSearchReady } from '../lib/editorial';
import { getArticles, getArticleAlternates } from '../lib/blog';
import { getBlogPageCount, getBlogPageInfo, blogPagePath, getBlogPageAlternates } from '../lib/blog-pagination';

export default function sitemap() {
  const out = [];
  for (const lang of CODES) {
    if (!isSearchReady(lang)) continue;
    out.push({ url:`${DOMAIN}/${lang}`, changeFrequency:'weekly', priority:1, alternates:{languages:languageAlternates('')} });
    out.push({ url:`${DOMAIN}/${lang}/about`, changeFrequency:'monthly', priority:.75, alternates:{languages:languageAlternates('/about')} });
    out.push({ url:`${DOMAIN}/${lang}/contact`, changeFrequency:'monthly', priority:.7, alternates:{languages:languageAlternates('/contact')} });
    if (["en", "ar", "sv", "de", "fr", "es", "it", "nl", "da", "no", "fi", "pt", "pl", "cs", "sk", "ro", "hu", "bg", "el", "et", "hr", "ru", "lt", "lv", "is", "mt", "sl", "tr", "ga", "sr", "uk", "sq"].includes(lang)) for (const slug of ['privacy','terms','refunds','how-it-works','pricing','document-requirements','document-rejection']) out.push({url:`${DOMAIN}/${lang}/${slug}`,changeFrequency:'monthly',priority:.65,alternates:{languages:Object.fromEntries(["en", "ar", "sv", "de", "fr", "es", "it", "nl", "da", "no", "fi", "pt", "pl", "cs", "sk", "ro", "hu", "bg", "el", "et", "hr", "ru", "lt", "lv", "is", "mt", "sl", "tr", "ga", "sr", "uk", "sq"].map(code=>[code,`${DOMAIN}/${code}/${slug}`]))}});
    out.push({ url:`${DOMAIN}/${lang}/faq`, changeFrequency:'monthly', priority:.7, alternates:{languages:languageAlternates('/faq')} });
    if (isSearchReady(lang)) for (const slug of getEnabledServiceSlugs()) out.push({ url:`${DOMAIN}/${lang}/services/${slug}`, changeFrequency:'monthly', priority:.8, alternates:{languages:reviewedLanguageAlternates(`/services/${slug}`)} });
    if (lang === 'en' && isServiceEnabled('apostille')) for (const d of APOSTILLE_DESTINATIONS) out.push({ url:`${DOMAIN}/${lang}/apostille/${d.slug}`, changeFrequency:'monthly', priority:.75 });
    const posts = getArticles(lang);
    for (let page=1;page<=getBlogPageCount(lang);page++) {
      const pagePosts=getBlogPageInfo(lang,page).posts;
      out.push({url:`${DOMAIN}${blogPagePath(lang,page)}`,lastModified:pagePosts.reduce((latest,post)=>post.updatedAt>latest?post.updatedAt:latest,pagePosts[0].updatedAt),changeFrequency:'weekly',priority:page===1?.7:.5,alternates:{languages:getBlogPageAlternates(page)}});
    }
    for (const post of posts) out.push({ url:`${DOMAIN}/${lang}/blog/${post.slug}`, lastModified:post.updatedAt, changeFrequency:'monthly', priority:.6, alternates:{languages:getArticleAlternates(post.slug,DOMAIN)} });
  }
  return out;
}
