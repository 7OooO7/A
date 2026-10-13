'use client';
import {useEffect,useRef,useState} from 'react';
import Link from 'next/link';
import {usePathname,useRouter} from 'next/navigation';
import langs from '../lib/langs.json';
import {BRAND} from '../lib/brand';
import {getUi,getCategories,getServices} from '../lib/services';
import aboutCopy from '../lib/aboutCopy.json';
import navCopy from '../lib/navigationCopy.json';

export default function Header({lang,m}){
 const [open,setOpen]=useState(null),[mobile,setMobile]=useState(false),[menuTop,setMenuTop]=useState(76);
 const shell=useRef(null),router=useRouter(),path=usePathname(),u=getUi(lang);
 const t=navCopy[lang]||navCopy.en;
 const categories=getCategories(lang),services=getServices(m,lang);
 const guides=[['how-it-works',t.how],['pricing',t.pricing],['document-requirements',t.documents],['document-rejection',t.issues],['faq',m.faqLabel]];
 const change=e=>{const next=e.target.value;setOpen(null);setMobile(false);if(/^\/en\/apostille\//.test(path)&&next!=='en')return router.push(`/${next}/services/apostille`);router.push(path.replace(/^\/[^/]+/,'/'+next));};
 useEffect(()=>{setOpen(null);setMobile(false)},[path]);
 useEffect(()=>{const click=e=>{if(shell.current&&!shell.current.contains(e.target)){setOpen(null);setMobile(false)}};const key=e=>{if(e.key==='Escape'){setOpen(null);setMobile(false)}};document.addEventListener('pointerdown',click);document.addEventListener('keydown',key);return()=>{document.removeEventListener('pointerdown',click);document.removeEventListener('keydown',key)}},[]);
 const toggle=id=>{if(shell.current)setMenuTop(shell.current.getBoundingClientRect().bottom+8);setOpen(x=>x===id?null:id)};
 const close=()=>{setOpen(null);setMobile(false)};
 const group=(id,label,content,large=false)=><div className={'lux-nav-group'+(open===id?' active':'')} key={id}>
  <button type="button" className="lux-nav-trigger" aria-expanded={open===id} aria-controls={'lux-panel-'+id} onClick={()=>toggle(id)}>{label}<span aria-hidden="true" className="lux-nav-chevron">⌄</span></button>
  <div id={'lux-panel-'+id} className={'lux-nav-panel'+(large?' lux-nav-mega':'')} hidden={open!==id}>{content}</div>
 </div>;
 return <header className="site-header lux-header" ref={shell} style={{"--lux-menu-top":`${menuTop}px`}}>
  <Link className="logo" href={`/${lang}`} onClick={close} aria-label={BRAND.name}><span className="brand-mark" aria-hidden="true">P</span><span className="brand-copy"><b>POA DUBAI</b><small>{u.euUae}</small></span></Link>
  <nav className={'lux-navigation'+(mobile?' mobile-visible':'')} id="nav" aria-label={t.navigation}>
   <Link className="lux-nav-home" href={`/${lang}`} onClick={close}>{m.nav[0]}</Link>
   {group('services',m.servicesLabel||t.services,<div className="lux-mega-layout"><div className="lux-mega-main"><div className="lux-panel-intro"><span>{t.services}</span><p>{t.serviceIntro}</p></div><div className="lux-service-groups">{categories.map(c=><div className="lux-service-category" key={c.id}><Link className="lux-category-title" href={`/${lang}#category-${c.id}`} onClick={close}>{c.title}<span aria-hidden="true">↗</span></Link>{services.filter(s=>s.category===c.id).slice(0,3).map(s=><Link key={s.slug} href={`/${lang}/services/${s.slug}`} onClick={close}>{s.title}</Link>)}</div>)}</div></div><aside className="lux-mega-aside"><span className="lux-aside-kicker">POA DUBAI</span><strong>{t.needHelp}</strong><p>{t.helpDescription}</p><Link href={`/${lang}/contact`} onClick={close}>{t.start} <span aria-hidden="true">↗</span></Link></aside></div>,true)}
   {group('guides',t.guides,<div className="lux-small-panel"><p className="lux-panel-heading">{t.guideIntro}</p>{guides.map(([slug,label])=><Link key={slug} href={`/${lang}/${slug}`} onClick={close}>{label}<span aria-hidden="true">↗</span></Link>)}</div>)}
   {group('explore',t.explore,<div className="lux-small-panel"><p className="lux-panel-heading">{t.exploreIntro}</p><Link href={`/${lang}/about`} onClick={close}>{aboutCopy[lang]?.title||t.about}<span aria-hidden="true">↗</span></Link><Link href={`/${lang}/blog`} onClick={close}>{m.blogLabel}<span aria-hidden="true">↗</span></Link><Link href={`/${lang}/contact`} onClick={close}>{m.nav[1]}<span aria-hidden="true">↗</span></Link></div>)}
   <Link className="lux-nav-cta" href={`/${lang}/contact`} onClick={close}>{t.start}<span aria-hidden="true">↗</span></Link>
  </nav>
  <div className="lux-header-tools"><select id="lang" aria-label={t.language} value={lang} onChange={change}>{langs.map(l=><option key={l.code} value={l.code}>{l.name}</option>)}</select><button type="button" className="lux-mobile-toggle" aria-expanded={mobile} aria-controls="nav" aria-label={mobile?t.close:t.menu} onClick={()=>{setMobile(v=>!v);setOpen(null)}}><span aria-hidden="true">{mobile?'×':'☰'}</span></button></div>
 </header>;
}
