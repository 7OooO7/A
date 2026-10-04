import Link from 'next/link';
import { notFound } from 'next/navigation';
import { CODES, DOMAIN, MAIL, getM } from '../../../../lib/i18n';
import { SERVICE_SLUGS, BRAND } from '../../../../lib/brand';
import { getService, getServices, getCategories } from '../../../../lib/services';
import { languageAlternates, absolute, breadcrumbSchema, safeJsonLd, OG_LOCALE } from '../../../../lib/seo';
import { APOSTILLE_DESTINATIONS } from '../../../../lib/apostille';

export const dynamicParams = false;
export function generateStaticParams(){ return CODES.flatMap(lang=>SERVICE_SLUGS.map(slug=>({lang,slug}))); }
export async function generateMetadata({params}){
 const {lang,slug}=await params; const m=await getM(lang); const s=getService(m,slug); if(!s)return{};
 const title=`${s.title} | ${BRAND.name}`; const url=absolute(lang,`/services/${slug}`);
 return {title,description:s.summary,alternates:{canonical:url,languages:languageAlternates(`/services/${slug}`)},robots:{index:true,follow:true},openGraph:{title,description:s.summary,url,siteName:BRAND.name,locale:OG_LOCALE(lang),type:'website'},twitter:{card:'summary_large_image',title,description:s.summary}};
}
export default async function ServicePage({params}){
 const {lang,slug}=await params; const m=await getM(lang); const service=getService(m,slug); if(!service)notFound();
 const all=getServices(m); const related=all.filter(s=>s.slug!==slug&&s.category===service.category).slice(0,5); const category=getCategories().find(c=>c.id===service.category);
 const international=service.category==='international'; const url=absolute(lang,`/services/${slug}`);
 const schemas=[
  {'@context':'https://schema.org','@type':'Service','@id':`${url}#service`,name:service.title,description:service.summary,serviceType:service.title,provider:{'@type':'Organization','@id':`${DOMAIN}/#organization`,name:BRAND.name,url:DOMAIN},areaServed:[{'@type':'Place',name:'Europe'},{'@type':'Country',name:'United Arab Emirates'}],url},
  breadcrumbSchema(lang,[{name:BRAND.name,path:''},{name:category?.title||m.sh,path:`#${service.category}`},{name:service.title,path:`/services/${slug}`}])
 ];
 return <main className="w service-page">
  <nav aria-label="Breadcrumb" className="breadcrumbs"><Link href={`/${lang}`}>{BRAND.name}</Link><span>›</span><Link href={`/${lang}#${service.category}`}>{category?.title||m.sh}</Link><span>›</span><span aria-current="page">{service.title}</span></nav>
  <section className="service-hero"><span className="kicker">{BRAND.name} · {BRAND.descriptor}</span><h1>{service.title}</h1><p>{service.summary}</p><div className="hero-actions"><a className="btn p" href={`mailto:${MAIL}?subject=${encodeURIComponent(service.title)}`}>{m.mail}</a><Link className="btn outline" href={`/${lang}#${service.category}`}>All {category?.title} services</Link></div></section>
  <section className="service-content"><div><span className="kicker">Service overview</span><h2>{service.title}</h2><p>{service.summary}</p>
   <h3>How we help</h3><p>POA Dubai coordinates the document and procedural route around your intended UAE use. We review the purpose, identify the documents and execution route, and coordinate with the appropriate authorised professionals, notaries, translators, couriers or UAE-side service providers where required.</p>
   {slug==='apostille'?<><div className="route-note"><b>Current Apostille scope: documents issued in Sweden</b><p>We currently coordinate Apostille for eligible Sweden-issued documents intended for use in countries where the Hague Apostille Convention route applies. UAE-bound documents are handled separately through Legalisation / Attestation.</p></div><h3>Choose the destination country</h3><p>Destination pages are written around Swedish documents for use abroad — not as a claim that we issue Apostilles for documents originating in that destination country.</p><div className="related-grid">{APOSTILLE_DESTINATIONS.map(d=><Link key={d.slug} href={`/${lang}/apostille/${d.slug}`}><b>{d.name}</b><span>→</span></Link>)}</div></>:international&&<div className="route-note"><b>Important for international documents</b><p>Apostille, legalisation and attestation are different routes. The correct route depends on the country that issued the document, the destination and the receiving authority. We confirm the required route before processing.</p></div>}
   <h3>Who this is for</h3><p>Designed for clients living in Sweden, Europe or elsewhere who need to complete UAE-related matters remotely, as well as clients already inside Dubai or the wider UAE.</p>
   <h3>What happens next</h3><ul className="service-list"><li>Tell us the intended use and destination</li><li>We check the likely document and authority route</li><li>You receive the required-document checklist</li><li>We coordinate the agreed processing steps</li><li>Completed documents are returned digitally or by courier where applicable</li></ul>
  </div><aside><span className="kicker">Process</span>{m.st.map((step,i)=><div className="mini-step" key={i}><b>0{i+1}</b><span>{step[0]}</span></div>)}<div className="scope-box"><b>Independent coordination service</b><p>POA Dubai is not presented as a court, government authority, law firm or Notarius Publicus. Reserved acts are carried out by the relevant authorised provider or authority.</p></div></aside></section>
  {related.length>0&&<section className="related"><span className="kicker">Related services</span><h2>You may also need</h2><div className="related-grid">{related.map(r=><Link key={r.slug} href={`/${lang}/services/${r.slug}`}><b>{r.title}</b><span>→</span></Link>)}</div></section>}
  <script type="application/ld+json" dangerouslySetInnerHTML={{__html:safeJsonLd(schemas)}} />
 </main>;
}
