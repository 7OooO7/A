import Link from 'next/link';
import {notFound} from 'next/navigation';
import {CODES,DOMAIN,MAIL,getM} from '../../../../lib/i18n';
import {SERVICE_SLUGS,BRAND} from '../../../../lib/brand';
import {getService,getServices,getCategories,getUi} from '../../../../lib/services';
import {getServiceContent,getResearch} from '../../../../lib/serviceContent';
import marketProfiles from '../../../../lib/marketProfiles.json';
import {isSearchReady} from '../../../../lib/editorial';
import {languageAlternates,absolute,breadcrumbSchema,safeJsonLd,OG_LOCALE} from '../../../../lib/seo';
export const dynamicParams=false;
export function generateStaticParams(){return CODES.flatMap(lang=>SERVICE_SLUGS.map(slug=>({lang,slug})))}

const labels=(lang,u,m)=>({
  what:u.overview,
  before:u.process,
  remote:u.remote,
  questions:u.faq,
  problems:u.next
});

export async function generateMetadata({params}){
 const {lang,slug}=await params,m=await getM(lang),s=getService(m,slug,lang),r=getResearch(slug);if(!s)return{};
 const title=`${s.title} | ${BRAND.name}`,url=absolute(lang,`/services/${slug}`);
 return{title,description:s.summary,keywords:getServiceContent(slug,lang)?.keywords||r?.research?.secondaryKeywords||[],alternates:{canonical:url,languages:languageAlternates(`/services/${slug}`)},robots:{index:isSearchReady(lang),follow:true},openGraph:{title,description:s.summary,url,siteName:BRAND.name,locale:OG_LOCALE(lang),type:'website'},twitter:{card:'summary_large_image',title,description:s.summary}};
}

export default async function ServicePage({params}){
 const {lang,slug}=await params,m=await getM(lang),u=getUi(lang),service=getService(m,slug,lang);if(!service)notFound();
 const content=getServiceContent(slug,lang),all=getServices(m,lang),research=getResearch(slug),category=getCategories(lang).find(c=>c.id===service.category),url=absolute(lang,`/services/${slug}`),L=labels(lang,u,m),market=marketProfiles[lang]||marketProfiles.en;
 const preferred=(research?.related||[]).map(x=>all.find(s=>s.slug===x)).filter(Boolean);
 const related=preferred.filter(r=>r.slug!==slug);
 const linkedDestinations=new Set();
 const anchorVariants=(r)=>{
   const local=getServiceContent(r.slug,lang);
   const raw=[r.title,...(local?.keywords||[])];
   return [...new Set(raw.flatMap(x=>String(x||'').split(/\s*[\/|]\s*|\s*\([^)]*\)\s*/)).map(x=>x.trim()).filter(x=>x.length>=5))].sort((a,b)=>b.length-a.length);
 };
 const renderText=(text)=>{
   if(!text)return text;
   let parts=[String(text)];
   for(const r of related){
     if(r.slug===slug||linkedDestinations.has(r.slug))continue;
     const variants=anchorVariants(r);
     let linked=false;
     for(const phrase of variants){
       if(linked)break;
       const next=[];
       for(const part of parts){
         if(typeof part!=='string'||linked){next.push(part);continue;}
         const i=part.toLocaleLowerCase(lang).indexOf(phrase.toLocaleLowerCase(lang));
         if(i<0){next.push(part);continue;}
         const before=part.slice(0,i),match=part.slice(i,i+phrase.length),after=part.slice(i+phrase.length);
         if(before)next.push(before);
         next.push(<Link className="internal-link" key={`${r.slug}-${linkedDestinations.size}`} href={`/${lang}/services/${r.slug}`}>{match}</Link>);
         if(after)next.push(after);
         linked=true;linkedDestinations.add(r.slug);
       }
       parts=next;
     }
   }
   return parts;
 };
 const faq=(content?.faq||[]).slice(0,5).map(x=>({q:x.q,a:x.a}));
 const schemas=[{'@context':'https://schema.org','@type':'Service','@id':`${url}#service`,name:service.title,description:service.summary,serviceType:service.title,provider:{'@type':'Organization','@id':`${DOMAIN}/#organization`,name:BRAND.name,url:DOMAIN},url},breadcrumbSchema(lang,[{name:BRAND.name,path:''},{name:category?.title||m.sh,path:`#${service.category}`},{name:service.title,path:`/services/${slug}`}]),{'@context':'https://schema.org','@type':'FAQPage',mainEntity:faq.map(x=>({'@type':'Question',name:x.q,acceptedAnswer:{'@type':'Answer',text:x.a}}))}];
 return <main className="w service-page">
  <nav aria-label="Breadcrumb" className="breadcrumbs"><Link href={`/${lang}`}>{BRAND.name}</Link><span>›</span><Link href={`/${lang}#${service.category}`}>{category?.title||m.sh}</Link><span>›</span><span aria-current="page">{service.title}</span></nav>
  <section className="service-hero"><span className="kicker">{BRAND.name} · {u.euUae}</span><h1>{service.title}</h1><p>{content?.shortDescription||service.summary}</p><div className="hero-actions"><a className="btn p" href={`mailto:${MAIL}?subject=${encodeURIComponent(service.title)}`}>{m.mail}</a><Link className="btn outline" href={`/${lang}#${service.category}`}>{category?.title}</Link></div></section>
  <section className="service-content"><article>
   <span className="kicker">{u.overview}</span><h2>{service.title}</h2><p>{renderText(content?.intro)}</p>
   <h2>{L.what}</h2><p>{renderText(content?.what)}</p>
   <h2>{u.howHelp}</h2><p>{renderText(content?.howHelp)}</p>
   <h2>{L.before}</h2><p>{renderText(content?.beforeYouStart)}</p>
   <h2>{L.remote}</h2><p>{renderText(content?.remote)}</p>
   <h2>{L.questions}</h2><div className="faq-list">{faq.map((x,i)=><details key={i}><summary>{renderText(x.q)}</summary><p>{renderText(x.a)}</p></details>)}</div>
  </article><aside><span className="kicker">{u.process}</span>{m.st.map((step,i)=><div className="mini-step" key={i}><b>{i+1}</b><span>{step[0]}</span></div>)}<div className="scope-box"><b>{u.independent}</b><p>{m.note}</p></div></aside></section>
  <script type="application/ld+json" dangerouslySetInnerHTML={{__html:safeJsonLd(schemas)}}/>
 </main>;
}
