'use client';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import langs from '../lib/langs.json';

export default function Header({ lang, m }) {
  const router = useRouter();
  const path = usePathname();
  const change = (e) => router.push(path.replace(/^\/[^/]+/, '/' + e.target.value));
  return (
    <header>
      <Link className="logo" href={`/${lang}`}>
        <svg width="34" height="34" viewBox="0 0 34 34" fill="none" stroke="#151e2d" strokeWidth="2" aria-hidden="true">
          <circle cx="17" cy="17" r="15" />
          <path d="M4 12c6 2 8 6 13 5s6-5 13-3M8 27c3-5 8-4 10-8" />
        </svg>
        <span><b>POA</b><small>DUBAI</small></span>
      </Link>
      <nav id="nav">
        <Link href={`/${lang}`}>{m.nav[0]}</Link>
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
