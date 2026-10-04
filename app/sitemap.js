import { CODES, SLUGS, DOMAIN } from '../lib/i18n';
import { SERVICE_SLUGS } from '../lib/brand';
import { languageAlternates } from '../lib/seo';
import { APOSTILLE_DESTINATIONS } from '../lib/apostille';

export default function sitemap() {
  const out = [];
  for (const lang of CODES) {
    out.push({ url:`${DOMAIN}/${lang}`, changeFrequency:'weekly', priority:1, alternates:{languages:languageAlternates('')} });
    out.push({ url:`${DOMAIN}/${lang}/contact`, changeFrequency:'monthly', priority:.7, alternates:{languages:languageAlternates('/contact')} });
    out.push({ url:`${DOMAIN}/${lang}/faq`, changeFrequency:'monthly', priority:.7, alternates:{languages:languageAlternates('/faq')} });
    for (const slug of SERVICE_SLUGS) out.push({ url:`${DOMAIN}/${lang}/services/${slug}`, changeFrequency:'monthly', priority:.8, alternates:{languages:languageAlternates(`/services/${slug}`)} });
    if (lang === 'en') for (const d of APOSTILLE_DESTINATIONS) out.push({ url:`${DOMAIN}/${lang}/apostille/${d.slug}`, changeFrequency:'monthly', priority:.75 });
    out.push({ url:`${DOMAIN}/${lang}/blog`, changeFrequency:'weekly', priority:.7, alternates:{languages:languageAlternates('/blog')} });
    for (const slug of SLUGS) out.push({ url:`${DOMAIN}/${lang}/blog/${slug}`, changeFrequency:'monthly', priority:.6, alternates:{languages:languageAlternates(`/blog/${slug}`)} });
  }
  return out;
}
