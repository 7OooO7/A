import Link from 'next/link';
import { getM, MAIL, DOMAIN } from '../../lib/i18n';
import { BRAND } from '../../lib/brand';
import { getCategories, getCategoryServices } from '../../lib/services';

export default async function Home({ params }) {
  const { lang } = await params;
  const m = await getM(lang);
  const categories = getCategories();
  const ld = [
    {'@context':'https://schema.org','@type':'Organization',name:BRAND.name,url:`${DOMAIN}/${lang}`,description:m.sub,email:MAIL,areaServed:['Sweden','Europe','United Arab Emirates']},
    {'@context':'https://schema.org','@type':'ItemList',name:'POA Dubai services',itemListElement:categories.flatMap(c=>getCategoryServices(c.id)).map((s,i)=>({'@type':'ListItem',position:i+1,name:s.title,url:`${DOMAIN}/${lang}/services/${s.slug}`}))},
    {'@context':'https://schema.org','@type':'FAQPage',mainEntity:m.faq[1].map(q=>({'@type':'Question',name:q[0],acceptedAnswer:{'@type':'Answer',text:q[1]}}))},
  ];
  return <main>
    <section className="hero-shell"><div className="w hero">
      <div className="eyebrow">{BRAND.descriptor}</div><h1>{m.h1}</h1><p>{m.sub}</p>
      <div className="hero-actions"><a className="btn p" href={`mailto:${MAIL}?subject=POA%20Dubai%20Request`}>{m.mail}</a><a className="btn g" href="#services">Explore all services</a></div>
      <div className="trust-row"><span>Remote-first</span><span>Europe → UAE</span><span>Inside UAE</span><span>Multilingual</span></div>
    </div></section>
    <div className="w">
      <section id="services" className="section-head"><div><span className="kicker">Complete service directory</span><h2>{m.sh}</h2></div><p className="section-intro">From international document preparation in Europe to UAE powers of attorney, property, corporate, notary and government-related coordination.</p></section>
      <nav className="category-nav" aria-label="Service categories">{categories.map(c=><a key={c.id} href={`#${c.id}`}>{c.title}</a>)}</nav>
      {categories.map(category=><section className="service-category" id={category.id} key={category.id}>
        <div className="category-heading"><div><span className="kicker">POA Dubai</span><h2>{category.title}</h2></div><p>{category.intro}</p></div>
        <div className="service-grid catalog-grid">{getCategoryServices(category.id).map((service,i)=><Link className="service-card compact" href={`/${lang}/services/${service.slug}`} key={service.slug}><span className="service-no">{String(i+1).padStart(2,'0')}</span><h3>{service.title}</h3><p>{service.summary}</p><span className="card-link">View service →</span></Link>)}</div>
      </section>)}
      <section className="process-section"><div className="section-head"><div><span className="kicker">Simple process</span><h2>{m.ph}</h2></div></div><div className="process-grid">{m.st.map((v,i)=><div className="process-card" key={i}><span>0{i+1}</span><h3>{v[0]}</h3><p>{v[1]}</p></div>)}</div><p className="note">{m.note}</p></section>
      <section id="faq" className="faq-section"><div className="section-head"><div><span className="kicker">FAQ</span><h2>{m.faq[0]}</h2></div></div><div className="faq-list">{m.faq[1].map((q,i)=><details key={i}><summary>{q[0]}</summary><p>{q[1]}</p></details>)}</div></section>
    </div><script type="application/ld+json" dangerouslySetInnerHTML={{__html:JSON.stringify(ld)}} />
  </main>;
}
