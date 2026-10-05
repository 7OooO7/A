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
            <Link className="bc" href={`/${lang}/blog/${SLUGS[i]}`} key={SLUGS[i]}>
              <div className="bi" dangerouslySetInnerHTML={{ __html: IMG[i] }} />
              <div className="bm">POA DUBAI &nbsp;·&nbsp; {fmt(BD[i], lang)}</div>
              <h3>{z[0]}</h3>
              <p>{z[1]}</p>
              <span className="rm">{m.rm}</span>
            </Link>
          ))}
        </div>
      </section>
    </main>
  );
}
