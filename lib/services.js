
import { SERVICE_CATEGORIES, SERVICES } from './serviceCatalog';
import uiData from './uiCopy.json';
import arTitles from './serviceTitles.ar.json';
import {getServiceContent} from './serviceContent';

const catIndex={poa:0,property:1,company:2,vehicle:3,notary:4,international:5};
export function getUi(lang){ return uiData[lang] || uiData.en; }
export function getCategories(lang='en'){
 const u=getUi(lang);
 return SERVICE_CATEGORIES.map((c,i)=>({...c,title:u.categories[i],
   intro: lang==='en' ? c.intro : `${u.categories[i]} — ${u.directoryIntro}`}));
}
function localizedTitle(lang, slug, english){
 const local=getServiceContent(slug,lang);
 if(local?.title) return local.title;
 if(lang==='ar' && arTitles[slug]) return arTitles[slug];
 return english;
}
export function getServices(m,lang='en'){
 const u=getUi(lang);
 return SERVICES.map(([slug,category,title,summary])=>({
   slug,category,title:localizedTitle(lang,slug,title),
   summary: getServiceContent(slug,lang)?.shortDescription || (lang==='en' ? summary : `${u.categories[catIndex[category]]}: ${u.directoryIntro}`),
   detail:summary,items:[]
 }));
}
export function getService(m,slug,lang='en'){ return getServices(m,lang).find(s=>s.slug===slug); }
export function getCategoryServices(id,m={},lang='en'){ return getServices(m,lang).filter(s=>s.category===id); }
export const legacy=['power-of-attorney','legal-notices','attestation-legalisation'];
