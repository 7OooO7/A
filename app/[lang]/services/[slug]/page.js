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

const labels=(lang,u)=>lang==='ar'?{
  what:'ما الذي تغطيه هذه الخدمة؟',before:'ما الذي يجب التحقق منه قبل البدء؟',remote:'هل يمكن إنجازها عن بُعد؟',questions:'أسئلة شائعة من العملاء',links:'خدمات قد تدخل في نفس المعاملة',problems:'مشكلات نحاول اكتشافها قبل التقديم',problemItems:['اختيار مسار توثيق أو تصديق غير مناسب للغرض النهائي.','نقص صلاحية أو بيان تطلبه الجهة التي ستستلم المستند.','البدء في الترجمة أو التصديق قبل التأكد من ترتيب الخطوات الصحيح.','افتراض أن النسخة الإلكترونية أو الأصل الورقي مقبول دون التحقق من الجهة.'],faqAnswers:['نراجع مكان وجودك والجهة المختصة وطريقة التحقق من الهوية أولًا؛ بعض الحالات يمكن تنسيقها عن بُعد بينما تحتاج حالات أخرى إلى أصل مستند أو حضور أو خطوة إضافية.','تختلف القائمة حسب الخدمة، لكننا نحدد بيانات الهوية والمستند الأساسي وأي إثبات ملكية أو صفة أو مستند داعم قبل البدء.','يعتمد ذلك على دولة إصدار المستند وجهة استخدامه ونوع المعاملة. لا نضيف خطوة توثيق أو ترجمة أو تصديق إلا عندما تكون مطلوبة للمسار الفعلي.','يعتمد القبول على الجهة المستلمة ونوع المستند. لذلك نتحقق من الصيغة المطلوبة بدل افتراض أن PDF أو النسخة الورقية مقبولة دائمًا.','من الأسباب الشائعة: بيانات غير متطابقة، صلاحيات ناقصة، مسار تصديق غير مكتمل، ترجمة غير مقبولة، أو تقديم نوع نسخة لا تقبله الجهة.']
}:{what:'What does this service cover?',before:'What should be checked before you start?',remote:'Can this be handled remotely?',questions:'Questions clients commonly ask',links:'Services that may be part of the same case',problems:'Problems we try to catch before submission',problemItems:['Using the wrong notarisation or attestation route for the final purpose.','Missing a power, detail or supporting document required by the receiving authority.','Starting translation or legalisation before confirming the correct order of steps.','Assuming a PDF or paper original will be accepted without checking the recipient’s rules.'],faqAnswers:['We first check where you are, the competent route and the available identity-verification method. Some cases can be coordinated remotely; others need originals, attendance or an additional authority step.','The checklist depends on the service. We identify the identity details, core document and any ownership, capacity or supporting evidence before the process starts.','It depends on the issuing country, destination, document type and receiving authority. We map the actual route rather than adding unnecessary formalities.','Acceptance depends on the recipient and document type. We check the expected format instead of assuming that a PDF or paper original is always sufficient.','Common causes include mismatched details, missing authority, an incomplete attestation chain, an unacceptable translation, or submitting the wrong document format.']};

export async function generateMetadata({params}){
 const {lang,slug}=await params,m=await getM(lang),s=getService(m,slug,lang),r=getResearch(slug);if(!s)return{};
 const title=`${s.title} | ${BRAND.name}`,url=absolute(lang,`/services/${slug}`);
 return{title,description:s.summary,keywords:r?.research?.secondaryKeywords||[],alternates:{canonical:url,languages:languageAlternates(`/services/${slug}`)},robots:{index:isSearchReady(lang),follow:true},openGraph:{title,description:s.summary,url,siteName:BRAND.name,locale:OG_LOCALE(lang),type:'website'},twitter:{card:'summary_large_image',title,description:s.summary}};
}

export default async function ServicePage({params}){
 const {lang,slug}=await params,m=await getM(lang),u=getUi(lang),service=getService(m,slug,lang);if(!service)notFound();
 const content=getServiceContent(slug,lang),all=getServices(m,lang),research=getResearch(slug),category=getCategories(lang).find(c=>c.id===service.category),url=absolute(lang,`/services/${slug}`),L=labels(lang,u),market=marketProfiles[lang]||marketProfiles.en;
 const preferred=(research?.related||[]).map(x=>all.find(s=>s.slug===x)).filter(Boolean);
 const related=[...preferred,...all.filter(s=>s.slug!==slug&&s.category===service.category&&!preferred.some(p=>p.slug===s.slug))].slice(0,5);
 const faq=(content?.questions||[]).map((q,i)=>({q,a:L.faqAnswers[i]||L.faqAnswers[0]}));
 const schemas=[{'@context':'https://schema.org','@type':'Service','@id':`${url}#service`,name:service.title,description:service.summary,serviceType:service.title,provider:{'@type':'Organization','@id':`${DOMAIN}/#organization`,name:BRAND.name,url:DOMAIN},url},breadcrumbSchema(lang,[{name:BRAND.name,path:''},{name:category?.title||m.sh,path:`#${service.category}`},{name:service.title,path:`/services/${slug}`}]),{'@context':'https://schema.org','@type':'FAQPage',mainEntity:faq.map(x=>({'@type':'Question',name:x.q,acceptedAnswer:{'@type':'Answer',text:x.a}}))}];
 return <main className="w service-page">
  <nav aria-label="Breadcrumb" className="breadcrumbs"><Link href={`/${lang}`}>{BRAND.name}</Link><span>›</span><Link href={`/${lang}#${service.category}`}>{category?.title||m.sh}</Link><span>›</span><span aria-current="page">{service.title}</span></nav>
  <section className="service-hero"><span className="kicker">{BRAND.name} · {BRAND.descriptor}</span><h1>{service.title}</h1><p>{content?.shortDescription||service.summary}</p><div className="hero-actions"><a className="btn p" href={`mailto:${MAIL}?subject=${encodeURIComponent(service.title)}`}>{m.mail}</a><Link className="btn outline" href={`/${lang}#${service.category}`}>{category?.title}</Link></div></section>
  <section className="service-content"><article>
   <span className="kicker">{u.overview}</span><h2>{service.title}</h2><p>{content?.intro}</p>
   <h2>{L.what}</h2><p>{content?.what}</p>
   <h2>{u.howHelp}</h2><p>{content?.howHelp}</p>
   <h2>{L.before}</h2><p>{content?.beforeYouStart}</p>
   <div className="content-callout"><h3>{L.problems}</h3><ul>{L.problemItems.map((x,i)=><li key={i}>{x}</li>)}</ul></div>
   <h2>{L.remote}</h2><p>{content?.remote}</p>
   {related.length>0&&<><h2>{L.links}</h2><p>{lang==='ar'?'قد تتداخل هذه المعاملة مع خدمات أخرى بحسب المستند والجهة المختصة. من المسارات التي قد تكون ذات صلة: ':'Depending on the document and receiving authority, the same case may also involve: '}{related.map((r,i)=><span key={r.slug}>{i>0?'، ':''}<Link href={`/${lang}/services/${r.slug}`}>{r.title}</Link></span>)}.</p></>}
   <h2>{L.questions}</h2><div className="faq-list">{faq.map((x,i)=><details key={i}><summary>{x.q}</summary><p>{x.a}</p></details>)}</div>
  </article><aside><span className="kicker">{u.process}</span>{m.st.map((step,i)=><div className="mini-step" key={i}><b>{i+1}</b><span>{step[0]}</span></div>)}<div className="scope-box"><b>{u.independent}</b><p>{lang==='ar'?'ننسق الإجراءات والمستندات، بينما ينفذ التوثيق أو الترجمة المعتمدة أو الأعمال المحجوزة للجهات المرخصة من يملك الصلاحية القانونية لذلك.':'We coordinate the process and documents. Notarial, certified-translation and other reserved acts are performed by the appropriately authorised professional or authority.'}</p></div></aside></section>
  {related.length>0&&<section className="related"><span className="kicker">{u.related}</span><h2>{u.also}</h2><div className="related-grid">{related.map(r=><Link key={r.slug} href={`/${lang}/services/${r.slug}`}><b>{r.title}</b><span>{r.summary}</span></Link>)}</div></section>}
  <script type="application/ld+json" dangerouslySetInnerHTML={{__html:safeJsonLd(schemas)}}/>
 </main>;
}
