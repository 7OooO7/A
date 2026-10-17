import aboutCopy from './aboutCopy.json';
import editorialCopy from './editorialCopy.json';
import sourceData from './articleSources.json';
import {BRAND} from './brand';
import {DOMAIN} from './i18n';

export const IDENTITY_ID = `${DOMAIN}/#identity`;
export function getEditorialCopy(lang) { return editorialCopy[lang] || editorialCopy.en; }
export function identitySchema(lang='en') {
  const digits=String(BRAND.phone||'').replace(/\D/g,'');
  return {
    '@context':'https://schema.org','@type':'Organization','@id':IDENTITY_ID,
    name:BRAND.name,url:DOMAIN,email:BRAND.email,
    logo:{'@type':'ImageObject',url:`${DOMAIN}/images/brand/logo.png`},
    address:{'@type':'PostalAddress',...BRAND.address},
    ...(digits ? {telephone:`+${digits}`} : {}),
  };
}
export function articleAuthorSchema(post,lang) {
  // The site is the default author; a real named author can still be specified in blog.json.
  return post.author && post.author!==BRAND.name
    ? {'@type':'Person',name:post.author}
    : {'@type':'Organization','@id':IDENTITY_ID,name:BRAND.name,url:`${DOMAIN}/${lang}/about#content`};
}
export function getArticleSources(post,lang='en') {
  if(post.sources) return post.sources.map(source=>({name:source.name,url:source.url}));
  const a=aboutCopy[lang]?.authorities || aboutCopy.en.authorities,e=getEditorialCopy(lang);
  const names={'dubai-notary':a[0],mofa:a[2],'land-sale':a[3],
    'land-faq':`${a[3]} · ${e.sourcesFAQ}`,vehicle:a[4],translator:a[1],
    'bank-authority':e.bankSource,children:e.childrenSource};
  return (sourceData.articles[post.slug]||[]).map(id=>({name:names[id]||sourceData.sources[id].name,url:sourceData.sources[id].url}));
}
