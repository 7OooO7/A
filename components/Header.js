'use client';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import langs from '../lib/langs.json';
import { BRAND } from '../lib/brand';

export default function Header({ lang, m }) {
  const router = useRouter();
  const path = usePathname();
  const change = (e) => router.push(path.replace(/^\/[^/]+/, '/' + e.target.value));
  return (
    <header className="site-header">
      <Link className="logo" href={`/${lang}`} aria-label={BRAND.name}>
        <span className="brand-mark" aria-hidden="true">P</span>
        <span className="brand-copy"><b>POA DUBAI</b><small>{BRAND.descriptor}</small></span>
      </Link>
      <nav id="nav">
        <Link href={`/${lang}`}>{m.nav[0]}</Link>
        <Link href={`/${lang}#services`}>{m.servicesLabel}</Link>
        <Link href={`/${lang}#faq`}>{m.faqLabel}</Link>
        <Link href={`/${lang}/blog`}>{m.blogLabel}</Link>
        <a href="#contact">{m.nav[1]}</a>
      </nav>
      <select id="lang" aria-label="Language" value={lang} onChange={change}>
        {langs.map((l) => <option key={l.code} value={l.code}>{l.name}</option>)}
      </select>
    </header>
  );
}
