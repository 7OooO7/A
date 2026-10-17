'use client';
import {useState} from 'react';
import Link from 'next/link';
export default function FooterClient({lang,groups,waHref,independentLabel,roleText,year}){
 const [open,setOpen]=useState(null);
 const text=value=>typeof value==='string'?value.replace(/(?:\s*\u2014\s*|\s+\u2013\s+)/g,lang==='ar'?'، ':', '):value;
 return <footer className="site-footer"><style jsx global>{`
 .site-footer .footer-section { min-width: 0; }
 @media (min-width: 1024px) {
  .site-footer .footer-shell .footer-grid { grid-template-columns: repeat(4, minmax(0, 1fr)); }
 }
 @media (min-width: 768px) and (max-width: 1023px) {
  .site-footer .footer-shell .footer-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
 }
 @media (max-width: 767px) {
  .site-footer .footer-shell .footer-grid { grid-template-columns: minmax(0, 1fr); }
 }

 .site-footer .footer-whatsapp-wrap {
  width: 100%; max-width: 100%; min-width: 0; box-sizing: border-box;
 }
 .site-footer .footer-whatsapp-wrap .footer-whatsapp-btn {
  display: inline-flex !important; align-items: center; justify-content: center;
  gap: 9px !important; width: fit-content !important; max-width: 100% !important;
  min-width: 0 !important; height: auto !important; min-height: 42px !important;
  padding: 11px 15px !important; box-sizing: border-box;
  border: 0 !important; border-radius: 9px !important;
  background: #21644f !important; color: #fff !important;
  font-size: 12px !important; font-weight: 700 !important;
  white-space: normal !important; text-align: center; line-height: 20px !important;
  box-shadow: none !important; overflow-wrap: anywhere; word-break: normal;
 }
 .site-footer .footer-whatsapp-wrap .footer-whatsapp-label {
  display: block; flex: 0 1 auto; min-width: 0; max-width: 100%;
  white-space: normal !important; overflow-wrap: anywhere; word-break: normal;
 }
 .site-footer .footer-whatsapp-wrap .footer-whatsapp-btn::before,
 .site-footer .footer-whatsapp-wrap .footer-whatsapp-btn::after {
  position: static !important; inset: auto !important; transform: none !important;
  flex: 0 0 auto;
 }
 .site-footer .footer-whatsapp-wrap .footer-whatsapp-btn::before {
  width: 19px !important; height: 19px !important; flex: 0 0 19px !important;
 }
 .site-footer .footer-whatsapp-wrap .footer-whatsapp-btn svg {
  flex: 0 0 auto;
 }
 .site-footer .footer-whatsapp-wrap .footer-whatsapp-btn:hover {
  background: #194e3e !important; filter: none !important; transform: none !important;
 }

`}</style><div className="footer-shell"><div className="footer-grid">{groups.map((g,i)=><section className={`footer-section ${open===i?'is-open':''}`} key={i}><button className="footer-heading" type="button" aria-expanded={open===i} aria-controls={`footer-panel-${i}`} onClick={()=>setOpen(open===i?null:i)}><span>{text(g.title)}</span><span className="footer-chevron" aria-hidden="true">+</span></button><div id={`footer-panel-${i}`} className="footer-links">{g.links.map((x,j)=><Link key={j} href={x.href}>{text(x.label)}</Link>)}</div>{g.whatsapp?<div className="footer-whatsapp-wrap">{waHref?<a className="footer-whatsapp-btn whatsapp-site-cta" href={waHref} target="_blank" rel="noopener noreferrer"><span className="footer-whatsapp-label">WhatsApp</span></a>:<span className="footer-whatsapp-btn whatsapp-site-cta whatsapp-disabled" aria-disabled="true"><span className="footer-whatsapp-label">WhatsApp</span></span>}</div>:null}</section>)}</div><div className="footer-bottom"><div className="footer-brand"><b>POA DUBAI</b><span>{text(independentLabel)}</span></div><p>{text(roleText)}</p><small>© {year} POA DUBAI</small></div></div></footer>
}
