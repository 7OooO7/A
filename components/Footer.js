'use client';
import {useState} from 'react';
import Link from 'next/link';
import {BRAND} from '../lib/brand';
import {getUi,getServices} from '../lib/services';
import aboutCopy from '../lib/aboutCopy.json';

export default function Footer({m,lang}){
 const [open,setOpen]=useState(null),u=getUi(lang),a=aboutCopy[lang],services=getServices(m,lang);
 const waNumber=process.env.NEXT_PUBLIC_WHATSAPP_NUMBER||'';
 const waHref=waNumber?`https://wa.me/${waNumber.replace(/\D/g,'')}`:'';
 const featured=[]; for(const s of services){if(!featured.some(x=>x.category===s.category)) featured.push(s)}
 const groups=[
  {title:a.title,links:[{label:a.title,href:`/${lang}/about`},{label:m.servicesLabel,href:`/${lang}#services`}]},
  {title:m.servicesLabel,links:featured.slice(0,6).map(s=>({label:s.title,href:`/${lang}/services/${s.slug}`}))},
  {title:m.blogLabel,links:[{label:m.blogLabel,href:`/${lang}/blog`},{label:m.faqLabel,href:`/${lang}/faq`}]},
  {title:u.contact,links:[{label:u.contact,href:`/${lang}/contact`},{label:BRAND.email,href:`mailto:${BRAND.email}`}]}];
 return <footer className="site-footer"><div className="footer-shell"><div className="footer-grid">{groups.map((g,i)=><section className={`footer-section ${open===i?'is-open':''}`} key={i}><button className="footer-heading" type="button" aria-expanded={open===i} onClick={()=>setOpen(open===i?null:i)}><span>{g.title}</span><span className="footer-chevron" aria-hidden="true">+</span></button><div className="footer-links">{g.links.map((x,j)=><Link key={j} href={x.href}>{x.label}</Link>)}</div>{i===3?<div className="footer-whatsapp-wrap">{waHref?<a className="footer-whatsapp-btn whatsapp-site-cta" href={waHref} target="_blank" rel="noopener noreferrer">{m.wa||'WhatsApp'}</a>:<span className="footer-whatsapp-btn whatsapp-site-cta whatsapp-disabled" aria-disabled="true">{m.wa||'WhatsApp'}</span>}</div>:null}</section>)}</div><div className="footer-bottom"><div className="footer-brand"><b>POA DUBAI</b><span>{u.independent}</span></div><p>{a.roleText}</p><small>© {new Date().getFullYear()} POA DUBAI</small></div></div></footer>
}
