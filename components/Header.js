'use client';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import langs from '../lib/langs.json';
import { BRAND } from '../lib/brand';
import { getUi } from '../lib/services';
import aboutCopy from '../lib/aboutCopy.json';

export default function Header({ lang, m }) {
  const u=getUi(lang);
  const router = useRouter();
  const path = usePathname();
  const change = (e) => {
    const next=e.target.value;
    if (/^\/en\/apostille\//.test(path) && next!=='en') return router.push(`/${next}/services/apostille`);
    router.push(path.replace(/^\/[^/]+/, '/' + next));
  };
  return (
    <header className="site-header">
      <Link className="logo" href={`/${lang}`} aria-label={BRAND.name}>
        <span className="brand-mark" aria-hidden="true">P</span>
        <span className="brand-copy"><b>POA DUBAI</b><small>{u.euUae}</small></span>
      </Link>
      <nav id="nav">
        <Link href={`/${lang}`}>{m.nav[0]}</Link>
        <Link href={`/${lang}#services`}>{m.servicesLabel}</Link>
        <Link href={`/${lang}/about`}>{aboutCopy[lang].title}</Link>
        <Link href={`/${lang}/faq`}>{m.faqLabel}</Link>
        <Link href={`/${lang}/blog`}>{m.blogLabel}</Link>
        <Link href={`/${lang}/contact`}>{m.nav[1]}</Link>
      </nav>
      <select id="lang" aria-label="Language" value={lang} onChange={change}>
        {langs.map((l) => <option key={l.code} value={l.code}>{l.name}</option>)}
      </select>
    </header>
  );
}
