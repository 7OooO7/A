import { CODES, SLUGS, DOMAIN } from '../lib/i18n';

export default function sitemap() {
  const alt = (p) => ({ languages: Object.fromEntries(CODES.map((c) => [c, `${DOMAIN}/${c}${p}`])) });
  const out = [];
  for (const l of CODES) {
    out.push({ url: `${DOMAIN}/${l}`, alternates: alt('') });
    out.push({ url: `${DOMAIN}/${l}/blog`, alternates: alt('/blog') });
    for (const s of SLUGS) out.push({ url: `${DOMAIN}/${l}/blog/${s}`, alternates: alt('/blog/' + s) });
  }
  return out;
}
