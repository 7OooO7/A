'use client';
import {useEffect,useMemo,useRef,useState} from 'react';
import Link from 'next/link';

const norm=(v='')=>String(v).toLocaleLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g,'').trim();

export default function HeroServiceSearch({lang,searchIndex,labels}){
  const [q,setQ]=useState('');
  const [open,setOpen]=useState(false);
  const root=useRef(null);
  const query=norm(q);
  useEffect(()=>{
    const close=e=>{ if(root.current&&!root.current.contains(e.target)) setOpen(false); };
    document.addEventListener('pointerdown',close);
    return()=>document.removeEventListener('pointerdown',close);
  },[]);
  const results=useMemo(()=>{
    if(!query) return [];
    const tokens=query.split(/\s+/).filter(Boolean);
    const scored=searchIndex.map(s=>{
      const title=norm(s.title), keywords=norm((s.keywords||[]).join(' | ')), summary=norm(s.summary||'');
      const hay=`${title} | ${keywords} | ${summary}`;
      const tokenMatch=tokens.length>1&&tokens.every(t=>hay.includes(t));
      let score=title===query?120:title.startsWith(query)?100:title.includes(query)?85:keywords.includes(query)?65:hay.includes(query)?45:tokenMatch?35:0;
      if(s.lang===lang) score+=3;
      return {...s,score};
    }).filter(x=>x.score>0).sort((a,b)=>b.score-a.score);
    const seen=new Set();
    return scored.filter(x=>{const k=`${x.slug}:${x.lang}`;if(seen.has(k))return false;seen.add(k);return true;}).slice(0,6);
  },[query,searchIndex,lang]);
  const show=open&&q.trim().length>0;
  return <div className="hero-service-search" ref={root}>
    <label htmlFor="hero-service-query">{labels.label}</label>
    <div className="hero-search-box">
      <span aria-hidden="true">⌕</span>
      <input id="hero-service-query" value={q} onFocus={()=>setOpen(true)} onChange={e=>{setQ(e.target.value);setOpen(true)}} onKeyDown={e=>{if(e.key==='Escape')setOpen(false)}} placeholder={labels.placeholder} autoComplete="off" aria-expanded={show} aria-controls="hero-search-results" />
    </div>
    {show&&<div id="hero-search-results" className="hero-search-results" role="listbox" aria-label={labels.results}>
      {results.length?results.map((s,i)=><Link key={`${s.slug}-${s.lang}-${i}`} href={`/${lang}/services/${s.slug}`} onClick={()=>setOpen(false)}>
        <span className="hero-result-head"><strong>{s.title}</strong><em>{s.languageName}</em></span>
        <small>{s.summary}</small>
      </Link>):<Link className="hero-search-contact" href={`/${lang}/contact`} onClick={()=>setOpen(false)}><strong>{labels.noResultsTitle}</strong><small>{labels.noResultsText}</small></Link>}
    </div>}
  </div>;
}
