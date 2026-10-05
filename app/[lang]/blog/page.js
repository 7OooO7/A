import Link from 'next/link';
import { getM, fmt, SLUGS, CODES, DOMAIN } from '../../../lib/i18n';
import { IMG, BD } from '../../../lib/art';

export async function generateMetadata({ params }) {
  const { lang } = await params;
  const m = await getM(lang);
  return {
    title: `${m.blog[0]} | Poa Dubai`,
    description: m.blog[1][0][1],
    alternates: { canonical: `/${lang}/blog`, languages: Object.fromEntries(CODES.map((c) => [c, `${DOMAIN}/${c}/blog`])) },
  };
}

export default async function Blog({ params }) {
  const { lang } = await params;
  const m = await getM(lang);
  return (
    <main id="main-content" className="w">
      <section id="blog">
        <h2>{m.blog[0]}</h2>
        <div id="bll">
          {m.blog[1].map((z, i) => (
            <article className="bc" key={SLUGS[i]}>
              <div className="bi" dangerouslySetInnerHTML={{ __html: IMG[i] }} />
              <div className="bm">POA DUBAI &nbsp;·&nbsp; {fmt(BD[i], lang)}</div>
              <h3><Link className="blog-title-link" href={`/${lang}/blog/${SLUGS[i]}`}>{z[0]}</Link></h3>
              <p>{z[1]}</p>
            </article>
          ))}
        </div>
      </section>
    </main>
  );
}
