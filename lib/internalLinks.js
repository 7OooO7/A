export const PROTECTED_BRAND_NAMES=['POA Dubai'];
const BRAND_NAME=PROTECTED_BRAND_NAMES[0];

const escapeRegExp=(s)=>String(s).replace(/[.*+?^${}()|[\]\\]/g,'\\$&');
const BRAND_RE=new RegExp(escapeRegExp(BRAND_NAME).replace(/\\ /g,'\\s+'),'ig');

export function isProtectedBrandPhrase(value=''){
  return String(value).trim().toLocaleLowerCase()===BRAND_NAME.trim().toLocaleLowerCase();
}

export function findContextualMatch(text, phrase, lang='en'){
  if(!text||!phrase||isProtectedBrandPhrase(phrase)) return -1;
  const source=String(text), needle=String(phrase);
  const lower=source.toLocaleLowerCase(lang), nlower=needle.toLocaleLowerCase(lang);
  const protectedRanges=[];
  BRAND_RE.lastIndex=0;
  let m;
  while((m=BRAND_RE.exec(source))) protectedRanges.push([m.index,m.index+m[0].length]);
  let from=0;
  while(from<source.length){
    const i=lower.indexOf(nlower,from);
    if(i<0) return -1;
    const end=i+needle.length;
    const overlapsBrand=protectedRanges.some(([a,b])=>i<b&&end>a);
    if(!overlapsBrand) return i;
    from=Math.max(end,i+1);
  }
  return -1;
}
