import { getM, waLink, MAIL, DOMAIN } from '../../lib/i18n';

export default async function Home({ params }) {
  const { lang } = await params;
  const m = await getM(lang);
  const x = m.x;
  const ld = [
    {
      '@context': 'https://schema.org', '@type': 'ProfessionalService', name: 'Poa Dubai', url: `${DOMAIN}/${lang}`,
      description: m.sub, email: MAIL, telephone: '+971528997280', areaServed: 'Europe',
      address: { '@type': 'PostalAddress', streetAddress: 'Office BC-892948, 26th Floor, Amber Gem Tower, Sheikh Khalifa Street', addressLocality: 'Ajman', addressCountry: 'AE' },
    },
    {
      '@context': 'https://schema.org', '@type': 'FAQPage',
      mainEntity: m.faq[1].map((q) => ({ '@type': 'Question', name: q[0], acceptedAnswer: { '@type': 'Answer', text: q[1] } })),
    },
  ];
  return (
    <main className="w">
      <div className="hero">
        <h1>{m.h1}</h1>
        <p>{m.sub}</p>
        <a className="btn p" href={waLink(m)} target="_blank" rel="noopener noreferrer">{m.wa}</a>
        <a className="btn g" href={`mailto:${MAIL}?subject=Poa%20Dubai`} target="_blank" rel="noopener noreferrer">{m.mail}</a>
      </div>

      <section id="lic">
        <div className="w0">
          <p className="lt">{x[0]}</p>
          <div className="lg">
            {[1, 2, 3].map((i) => (
              <div className="lc" key={i}><span className="n">0{i}</span><b>{x[i]}</b></div>
            ))}
          </div>
        </div>
      </section>

      <section>
        <h2>{m.sh}</h2>
        <p className="note">{x[4]}</p>
        <div className="grid">
          {m.s.map((v, i) => (
            <div className="c sv" key={i}>
              <h3>{v[0]}</h3>
              <p>{x[5 + i][0]}</p>
              <ul className="l">{x[5 + i][1].map((t) => <li key={t}>{t}</li>)}</ul>
            </div>
          ))}
        </div>
      </section>

      <section>
        <h2>{m.ph}</h2>
        <div className="grid">
          {m.st.map((v, i) => (
            <div className="c st" key={i}><span className="n">0{i + 1}</span><h3>{v[0]}</h3><p>{v[1]}</p></div>
          ))}
        </div>
        <p className="note">{m.note}</p>
      </section>

      <section id="faq">
        <h2>{m.faq[0]}</h2>
        <div>
          {m.faq[1].map((q, i) => (
            <details key={i}><summary>{q[0]}</summary><p>{q[1]}</p></details>
          ))}
        </div>
      </section>

      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(ld) }} />
    </main>
  );
}
