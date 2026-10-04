import { CODES, DOMAIN } from './i18n';
import { BRAND } from './brand';

export const DEFAULT_LOCALE = 'en';
export const OG_LOCALE = (lang) => lang.replace('-', '_');
export function languageAlternates(path='') {
  const p = path ? (path.startsWith('/') ? path : `/${path}`) : '';
  const languages = Object.fromEntries(CODES.map(c => [c, `${DOMAIN}/${c}${p}`]));
  languages['x-default'] = `${DOMAIN}/${DEFAULT_LOCALE}${p}`;
  return languages;
}
export function absolute(lang, path='') {
  const p = path ? (path.startsWith('/') ? path : `/${path}`) : '';
  return `${DOMAIN}/${lang}${p}`;
}
export function breadcrumbSchema(lang, items) {
  return {
    '@context':'https://schema.org','@type':'BreadcrumbList',
    itemListElement: items.map((x,i)=>({'@type':'ListItem',position:i+1,name:x.name,item:x.url || absolute(lang,x.path||'')}))
  };
}
export function organizationSchema(lang, description) {
  return {'@context':'https://schema.org','@type':'Organization','@id':`${DOMAIN}/#organization`,name:BRAND.name,url:DOMAIN,email:BRAND.email,description,areaServed:[{'@type':'Place',name:'Europe'},{'@type':'Country',name:'United Arab Emirates'}]};
}
export function safeJsonLd(data){ return JSON.stringify(data).replace(/</g,'\\u003c'); }
