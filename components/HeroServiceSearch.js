'use client';
import {useMemo,useState} from 'react';
import Link from 'next/link';

const norm=(v='')=>String(v).toLocaleLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g,'').trim();

export default function HeroServiceSearch({lang,services,labels}){
  const [q,setQ]=useState('');
  const query=norm(q);
  const results=useMemo(()=>{
    if(!query) return [];
    return services.map(s=>{
      const hay=norm([s.title,s.summary,...(s.keywords||[])].join(' | '));
      const title=norm(s.title);
      const tokens=query.split(/\s+/).filter(Boolean);
      const tokenMatch=tokens.length>1&&tokens.every(t=>hay.includes(t));
      const score=title===query?100:title.startsWith(query)?80:title.includes(query)?65:hay.includes(query)?40:tokenMatch?30:0;
      return {...s,score};
    }).filter(x=>x.score>0).sort((a,b)=>b.score-a.score).slice(0,7);
  },[query,services]);
  const show=q.trim().length>0;
  return <div className="hero-service-search">
    <label htmlFor="hero-service-query">{labels.label}</label>
    <div className="hero-search-box">
      <span aria-hidden="true">⌕</span>
      <input id="hero-service-query" value={q} onChange={e=>setQ(e.target.value)} placeholder={labels.placeholder} autoComplete="off" />
    </div>
    {show && <div className="hero-search-results" role="listbox" aria-label={labels.results}>
      {results.length?results.map(s=><Link key={s.slug} href={`/${lang}/services/${s.slug}`}><strong>{s.title}</strong><small>{s.summary}</small></Link>):
      <Link className="hero-search-contact" href={`/${lang}/contact`}><strong>{labels.noResultsTitle}</strong><small>{labels.noResultsText}</small></Link>}
    </div>}
  </div>;
}
