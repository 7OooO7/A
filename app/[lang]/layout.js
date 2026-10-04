import '../globals.css';
import { notFound } from 'next/navigation';
import { CODES, RTL, DOMAIN, getM, waLink } from '../../lib/i18n';
import Header from '../../components/Header';
import Footer from '../../components/Footer';

export const dynamicParams = false;
export const generateStaticParams = () => CODES.map((lang) => ({ lang }));

export async function generateMetadata({ params }) {
  const { lang } = await params;
  if (!CODES.includes(lang)) return {};
  const m = await getM(lang);
  const languages = Object.fromEntries(CODES.map((c) => [c, `${DOMAIN}/${c}`]));
  languages['x-default'] = `${DOMAIN}/en`;
  return {
    metadataBase: new URL(DOMAIN),
    title: m.t,
    description: m.sub,
    alternates: { canonical: `/${lang}`, languages },
    openGraph: { title: m.t, description: m.sub, url: `/${lang}`, siteName: 'Poa Dubai', locale: lang, type: 'website' },
  };
}

export default async function Layout({ children, params }) {
  const { lang } = await params;
  if (!CODES.includes(lang)) notFound();
  const m = await getM(lang);
  return (
    <html lang={lang} dir={RTL.includes(lang) ? 'rtl' : 'ltr'}>
      <body>
        <div className="w"><Header lang={lang} m={{ nav: m.nav, faqLabel: m.faqLabel, blogLabel: m.blogLabel }} /></div>
        {children}
        <Footer m={m} />
        <a className="fab" href={waLink(m)} target="_blank" rel="noopener noreferrer">{m.wa}</a>
      </body>
    </html>
  );
}
