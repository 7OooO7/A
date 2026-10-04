import { DOMAIN } from '../lib/i18n';
export default function robots() {
  return { rules: { userAgent: '*', allow: '/' }, sitemap: `${DOMAIN}/sitemap.xml` };
}
