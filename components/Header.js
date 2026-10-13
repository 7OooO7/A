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
 const waNumber=(process.env.NEXT_PUBLIC_WHATSAPP_NUMBER||'').replace(/\D/g,'');
 const waHref=waNumber?`https://wa.me/${waNumber}`:null;
 const waLabel=m.wa||'WhatsApp';
 const whatsappIcon=<svg className="lux-whatsapp-icon" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true"><path d="M27.3 4.7A15.8 15.8 0 0 0 2.5 23.8L.3 31.7l8.1-2.1A15.8 15.8 0 0 0 27.3 4.7ZM16 29a13 13 0 0 1-6.6-1.8l-.5-.3-4.8 1.3 1.3-4.7-.3-.5A13 13 0 1 1 16 29Zm7.1-9.7c-.4-.2-2.3-1.1-2.6-1.3-.4-.1-.6-.2-.9.2-.3.4-1 1.3-1.3 1.6-.2.3-.5.3-.9.1-2.3-1.1-3.8-2-5.3-4.6-.4-.7.4-.7 1.1-2.2.1-.3.1-.6 0-.8l-1.2-3c-.3-.8-.7-.7-.9-.7h-.8c-.3 0-.8.1-1.1.5-.4.4-1.5 1.5-1.5 3.6s1.5 4.1 1.7 4.4c.2.3 3 4.6 7.3 6.4 2.7 1.2 3.7 1.3 5 1.1 1.5-.2 2.3-1.5 2.6-2.1.3-.6.3-1.2.2-1.3-.1-.2-.4-.3-.8-.5Z"/></svg>;
 const whatsappButton=(className)=>waHref?<a className={className} href={waHref} target="_blank" rel="noopener noreferrer" onClick={close}>{whatsappIcon}<span>{waLabel}</span></a>:<span className={className+' lux-wa-unavailable'} aria-disabled="true">{whatsappIcon}<span>{waLabel}</span></span>;
 const guides=[['how-it-works',t.how],['pricing',t.pricing],['document-requirements',t.documents],['document-rejection',t.issues],['faq',m.faqLabel]];
 const change=e=>{const next=e.target.value;setOpen(null);setMobile(false);if(/^\/en\/apostille\//.test(path)&&next!=='en')return router.push(`/${next}/services/apostille`);router.push(path.replace(/^\/[^/]+/,'/'+next));};
 useEffect(()=>{setOpen(null);setMobile(false)},[path]);
 useEffect(()=>{const click=e=>{if(shell.current&&!shell.current.contains(e.target)){setOpen(null);setMobile(false)}};const key=e=>{if(e.key==='Escape'){setOpen(null);setMobile(false)}};document.addEventListener('pointerdown',click);document.addEventListener('keydown',key);return()=>{document.removeEventListener('pointerdown',click);document.removeEventListener('keydown',key)}},[]);
 const toggle=id=>{if(shell.current)setMenuTop(shell.current.getBoundingClientRect().bottom+8);setOpen(x=>x===id?null:id)};
 const close=()=>{setOpen(null);setMobile(false)};
 const group=(id,label,content,large=false)=><div className={'lux-nav-group'+(open===id?' active':'')} key={id}>
  <button type="button" className="lux-nav-trigger" aria-expanded={open===id} aria-controls={'lux-panel-'+id} onClick={()=>toggle(id)}>{label}<svg aria-hidden="true" className="lux-nav-chevron" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><path d="m6.5 9 5.5 5.5L17.5 9"/></svg></button>
  <div id={'lux-panel-'+id} className={'lux-nav-panel'+(large?' lux-nav-mega':'')} hidden={open!==id}>{content}</div>
 </div>;
 return <header className="site-header lux-header" dir={lang==='ar'?'rtl':'ltr'} ref={shell} style={{"--lux-menu-top":`${menuTop}px`}}>
  <Link className="logo" href={`/${lang}`} onClick={close} aria-label={BRAND.name}><span className="brand-mark" aria-hidden="true">P</span><span className="brand-copy"><b>POA DUBAI</b><small>{u.euUae}</small></span></Link>
  <nav className={'lux-navigation'+(mobile?' mobile-visible':'')} id="nav" aria-label={t.navigation}>
   <Link className="lux-nav-home" href={`/${lang}`} onClick={close}>{m.nav[0]}</Link>
   {group('services',m.servicesLabel||t.services,<div className="lux-mega-layout"><div className="lux-mega-main"><div className="lux-panel-intro"><span>{t.services}</span><p>{t.serviceIntro}</p></div><div className="lux-service-groups">{categories.map(c=><div className="lux-service-category" key={c.id}><Link className="lux-category-title" href={`/${lang}#category-${c.id}`} onClick={close}>{c.title}<span aria-hidden="true">↗</span></Link>{services.filter(s=>s.category===c.id).slice(0,3).map(s=><Link key={s.slug} href={`/${lang}/services/${s.slug}`} onClick={close}>{s.title}</Link>)}</div>)}</div></div><aside className="lux-mega-aside"><span className="lux-aside-kicker">POA DUBAI</span><strong>{t.needHelp}</strong><p>{t.helpDescription}</p>{whatsappButton("lux-aside-whatsapp")}</aside></div>,true)}
   {group('guides',t.guides,<div className="lux-small-panel"><p className="lux-panel-heading">{t.guideIntro}</p>{guides.map(([slug,label])=><Link key={slug} href={`/${lang}/${slug}`} onClick={close}>{label}<span aria-hidden="true">↗</span></Link>)}</div>)}
   {group('explore',t.explore,<div className="lux-small-panel"><p className="lux-panel-heading">{t.exploreIntro}</p><Link href={`/${lang}/about`} onClick={close}>{aboutCopy[lang]?.title||t.about}<span aria-hidden="true">↗</span></Link><Link href={`/${lang}/blog`} onClick={close}>{m.blogLabel}<span aria-hidden="true">↗</span></Link><Link href={`/${lang}/contact`} onClick={close}>{m.nav[1]}<span aria-hidden="true">↗</span></Link></div>)}
   {whatsappButton("lux-nav-cta lux-nav-whatsapp")}
  </nav>
  <div className="lux-header-tools"><select id="lang" aria-label={t.language} value={lang} onChange={change}>{langs.map(l=><option key={l.code} value={l.code}>{l.name}</option>)}</select><button type="button" className="lux-mobile-toggle" aria-expanded={mobile} aria-controls="nav" aria-label={mobile?t.close:t.menu} onClick={()=>{setMobile(v=>!v);setOpen(null)}}><span aria-hidden="true">{mobile?'×':'☰'}</span></button></div>
 </header>;
}
