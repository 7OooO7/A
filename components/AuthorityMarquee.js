function Icon({type}){
 const common={width:20,height:20,viewBox:'0 0 24 24',fill:'none',stroke:'currentColor',strokeWidth:1.7,strokeLinecap:'round',strokeLinejoin:'round','aria-hidden':'true',focusable:'false'};
 const paths={
  court:<><path d="M12 3v18M5 7h14M7 7l-4 7h8L7 7Zm10 0-4 7h8l-4-7ZM7 21h10"/></>,
  justice:<><path d="M3 21h18M5 18h14M7 18V9m5 9V9m5 9V9M4 9h16L12 3 4 9Z"/></>,
  mofa:<><circle cx="12" cy="12" r="8"/><path d="M4 12h16M12 4c2.4 2.2 3.6 4.9 3.6 8S14.4 17.8 12 20c-2.4-2.2-3.6-4.9-3.6-8S9.6 6.2 12 4Z"/></>,
  property:<><path d="M3 11.5 12 4l9 7.5M5.5 10v10h13V10M9 20v-6h6v6"/></>,
  vehicle:<><path d="M4 16v-5l2-4h12l2 4v5M6 16h12M7 19h.01M17 19h.01M5 12h14"/></>,
  business:<><path d="M4 21V7h16v14M8 7V3h8v4M8 11h2m4 0h2m-8 4h2m4 0h2M3 21h18"/></>,
  identity:<><rect x="3" y="5" width="18" height="14" rx="2"/><circle cx="9" cy="11" r="2"/><path d="M6 16c.8-1.7 2-2.5 3-2.5s2.2.8 3 2.5m3-5h3m-3 4h3"/></>,
  immigration:<><path d="M5 3h10v18H5zM15 7h4v10h-4M8 12h4M10 10v4"/></>,
  notary:<><path d="M6 3h9l3 3v15H6zM14 3v4h4M9 11h6m-6 4h4"/><path d="m14 18 4-4 2 2-4 4-3 1 1-3Z"/></>,
  freezone:<><path d="M4 21V8l8-5 8 5v13M8 21v-5h8v5M8 10h2m4 0h2"/><path d="M2 21h20"/></>
 };
 return <svg {...common}>{paths[type]||paths.business}</svg>
}
const types=['court','justice','mofa','property','vehicle','business','identity','immigration','notary','freezone'];
export default function AuthorityMarquee({authorities,label}){
 const items=authorities.map((name,i)=>({name,type:types[i]||'business'}));
 const Track=({duplicate=false})=><div className="authority-marquee-track" aria-hidden={duplicate?'true':undefined}>{items.map((item,i)=><span className="authority-marquee-item" key={`${duplicate?'d':'p'}-${i}`}><Icon type={item.type}/><span>{item.name}</span></span>)}</div>;
 return <section className="authority-marquee-block" aria-label={label}><div className="authority-marquee"><div className="authority-marquee-runner"><Track/><Track duplicate/></div></div></section>
}
