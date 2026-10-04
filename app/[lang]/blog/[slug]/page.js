import Link from 'next/link';
import { notFound } from 'next/navigation';
import { getM, fmt, MAIL, SLUGS, CODES, RTL, DOMAIN } from '../../../../lib/i18n';
import { IMG, BD } from '../../../../lib/art';

export const dynamicParams = false;
export const generateStaticParams = () => CODES.flatMap((lang) => SLUGS.map((slug) => ({ lang, slug })));

export async function generateMetadata({ params }) {
  const { lang, slug } = await params;
  const i = SLUGS.indexOf(slug);
  if (i < 0) return {};
  const z = (await getM(lang)).blog[1][i];
  return {
    title: `${z[0]} | Poa Dubai`,
    description: z[1],
    alternates: { canonical: `/${lang}/blog/${slug}`, languages: Object.fromEntries(CODES.map((c) => [c, `${DOMAIN}/${c}/blog/${slug}`])) },
  };
}

export default async function Article({ params }) {
  const { lang, slug } = await params;
  const i = SLUGS.indexOf(slug);
  if (i < 0) notFound();
  const m = await getM(lang);
  const z = m.blog[1][i];
  const ld = {
    '@context': 'https://schema.org', '@type': 'Article', headline: z[0], description: z[1], inLanguage: lang,
    datePublished: BD[i], author: { '@type': 'Person', name: 'Mustafa' },
    publisher: { '@type': 'Organization', name: 'Poa Dubai' }, mainEntityOfPage: `${DOMAIN}/${lang}/blog/${slug}`,
  };
  return (
    <main className="w">
      <article id="art">
        <Link className="back" href={`/${lang}/blog`}>{RTL.includes(lang) ? '→ ' : '← '}{m.blog[0]}</Link>
        <div className="bi" dangerouslySetInnerHTML={{ __html: IMG[i] }} />
        <div className="bm">Mustafa &nbsp;·&nbsp; {fmt(BD[i], lang)}</div>
        <h1>{z[0]}</h1>
        <p className="lead">{z[1]}</p>
        <p>{z[2]}</p>
        <a className="btn p" href={`mailto:${MAIL}?subject=POA%20Dubai%20Request`}>{m.wa}</a>
        <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(ld) }} />
      </article>
    </main>
  );
}
