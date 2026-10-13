import { CODES, SLUGS, DOMAIN } from '../lib/i18n';
import { getEnabledServiceSlugs } from '../lib/serviceAvailability';
import { languageAlternates, reviewedLanguageAlternates } from '../lib/seo';
import { APOSTILLE_DESTINATIONS } from '../lib/apostille';
import { isSearchReady } from '../lib/editorial';

export default function sitemap() {
  const out = [];
  for (const lang of CODES) {
    if (!isSearchReady(lang)) continue;
    out.push({ url:`${DOMAIN}/${lang}`, changeFrequency:'weekly', priority:1, alternates:{languages:languageAlternates('')} });
    out.push({ url:`${DOMAIN}/${lang}/about`, changeFrequency:'monthly', priority:.75, alternates:{languages:languageAlternates('/about')} });
    out.push({ url:`${DOMAIN}/${lang}/contact`, changeFrequency:'monthly', priority:.7, alternates:{languages:languageAlternates('/contact')} });
    if (['ar','en','sv'].includes(lang)) for (const slug of ['privacy','terms','refunds','how-it-works','pricing','document-requirements','document-rejection']) out.push({url:`${DOMAIN}/${lang}/${slug}`,changeFrequency:'monthly',priority:.65,alternates:{languages:{en:`${DOMAIN}/en/${slug}`,ar:`${DOMAIN}/ar/${slug}`,sv:`${DOMAIN}/sv/${slug}`}}});
    out.push({ url:`${DOMAIN}/${lang}/faq`, changeFrequency:'monthly', priority:.7, alternates:{languages:languageAlternates('/faq')} });
    if (isSearchReady(lang)) for (const slug of getEnabledServiceSlugs()) out.push({ url:`${DOMAIN}/${lang}/services/${slug}`, changeFrequency:'monthly', priority:.8, alternates:{languages:reviewedLanguageAlternates(`/services/${slug}`)} });
    if (lang === 'en') for (const d of APOSTILLE_DESTINATIONS) out.push({ url:`${DOMAIN}/${lang}/apostille/${d.slug}`, changeFrequency:'monthly', priority:.75 });
    out.push({ url:`${DOMAIN}/${lang}/blog`, changeFrequency:'weekly', priority:.7, alternates:{languages:languageAlternates('/blog')} });
    for (const slug of SLUGS) out.push({ url:`${DOMAIN}/${lang}/blog/${slug}`, changeFrequency:'monthly', priority:.6, alternates:{languages:languageAlternates(`/blog/${slug}`)} });
  }
  return out;
}
