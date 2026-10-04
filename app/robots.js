import { DOMAIN } from '../lib/i18n';
export default function robots(){return {rules:[{userAgent:'*',allow:'/',disallow:['/api/','/_next/']}],sitemap:`${DOMAIN}/sitemap.xml`,host:DOMAIN};}
