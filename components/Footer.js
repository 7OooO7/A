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
 const guideLabels=lang==='ar'?{heading:'دليل العملاء',how:'كيف ننجز طلبك',pricing:'الأسعار وعروض التكلفة',requirements:'المستندات المطلوبة',issues:'حل مشكلات المستندات',policies:'المعلومات والسياسات',privacy:'الخصوصية',terms:'شروط الخدمة',refunds:'الإلغاء والاسترداد',company:'الشركة',resources:'الموارد'}:{heading:'Client Guides',how:'How It Works',pricing:'Pricing & Quotes',requirements:'Document Checklist',issues:'Document Issues & Solutions',policies:'Information & Policies',privacy:'Privacy & Document Care',terms:'Service Terms',refunds:'Cancellation & Refunds',company:'Company',resources:'Resources'};
 const svLabels={heading:'Kundguider',how:'Så fungerar det',pricing:'Priser och offerter',requirements:'Dokument och förberedelser',issues:'Problem med dokument?',policies:'Information och villkor',privacy:'Integritet och dokumenthantering',terms:'Villkor för våra tjänster',refunds:'Avbokning och återbetalning',company:'Företaget',resources:'Resurser'};
 const labels=lang==='sv'?svLabels:guideLabels;
 const guideLinks=[['how-it-works','how'],['pricing','pricing'],['document-requirements','requirements'],['document-rejection','issues']];
 const policyLinks=[['privacy','privacy'],['terms','terms'],['refunds','refunds']];
 const groups=[
  {title:labels.company,links:[{label:a.title,href:`/${lang}/about`},{label:u.contact,href:`/${lang}/contact`}]},
  {title:m.servicesLabel,links:featured.slice(0,8).map(s=>({label:s.title,href:`/${lang}/services/${s.slug}`}))},
  {title:labels.resources,links:[{label:m.blogLabel,href:`/${lang}/blog`},{label:m.faqLabel,href:`/${lang}/faq`}]},
  ...(['ar','en','sv'].includes(lang)?[{title:labels.heading,links:guideLinks.map(([slug,key])=>({label:labels[key],href:`/${lang}/${slug}`}))},{title:labels.policies,links:policyLinks.map(([slug,key])=>({label:labels[key],href:`/${lang}/${slug}`}))}]:[]),
  {title:u.contact,links:[{label:u.contact,href:`/${lang}/contact`},{label:BRAND.email,href:`mailto:${BRAND.email}`}],whatsapp:true}
 ];
 return <footer className="site-footer"><div className="footer-shell"><div className="footer-grid">{groups.map((g,i)=><section className={`footer-section ${open===i?'is-open':''}`} key={i}><button className="footer-heading" type="button" aria-expanded={open===i} onClick={()=>setOpen(open===i?null:i)}><span>{g.title}</span><span className="footer-chevron" aria-hidden="true">+</span></button><div className="footer-links">{g.links.map((x,j)=><Link key={j} href={x.href}>{x.label}</Link>)}</div>{g.whatsapp?<div className="footer-whatsapp-wrap">{waHref?<a className="footer-whatsapp-btn whatsapp-site-cta" href={waHref} target="_blank" rel="noopener noreferrer">{m.wa||'WhatsApp'}</a>:<span className="footer-whatsapp-btn whatsapp-site-cta whatsapp-disabled" aria-disabled="true">{m.wa||'WhatsApp'}</span>}</div>:null}</section>)}</div><div className="footer-bottom"><div className="footer-brand"><b>POA DUBAI</b><span>{u.independent}</span></div><p>{a.roleText}</p><small>© {new Date().getFullYear()} POA DUBAI</small></div></div></footer>
}
