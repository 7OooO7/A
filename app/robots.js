import { DOMAIN } from '../lib/i18n';

export default function robots() {
  return {
    rules: [
      {
        userAgent: 'Googlebot',
        allow: '/',
      },
      {
        userAgent: '*',
        allow: '/',
        disallow: ['/api/'],
      },
    ],
    sitemap: `${DOMAIN}/sitemap.xml`,
    host: DOMAIN,
  };
}