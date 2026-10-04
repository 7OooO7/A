export const PROTECTED_BRAND_NAMES=['POA Dubai'];
const BRAND_NAME=PROTECTED_BRAND_NAMES[0];

const escapeRegExp=(s)=>String(s).replace(/[.*+?^${}()|[\]\\]/g,'\\$&');
const BRAND_RE=new RegExp(escapeRegExp(BRAND_NAME).replace(/\\ /g,'\\s+'),'ig');

export function isProtectedBrandPhrase(value=''){
  return String(value).trim().toLocaleLowerCase()===BRAND_NAME.trim().toLocaleLowerCase();
}

function protectedBrandRanges(source){
  const ranges=[];
  BRAND_RE.lastIndex=0;
  let m;
  while((m=BRAND_RE.exec(source))) ranges.push([m.index,m.index+m[0].length]);
  return ranges;
}

// Returns the exact span to link. A service phrase written with spaces may also
// match the same phrase written with hyphens, e.g. "certified translation"
// matches "certified-translation" as one complete anchor.
export function findContextualSpan(text, phrase, lang='en'){
  if(!text||!phrase||isProtectedBrandPhrase(phrase)) return null;
  const source=String(text), clean=String(phrase).trim();
  if(!clean) return null;
  const tokens=clean.split(/[\s-]+/u).filter(Boolean).map(escapeRegExp);
  if(!tokens.length) return null;
  const core=tokens.join('[\\s\\-\\u2010-\\u2015]+');
  const re=new RegExp(core,'giu');
  const brandRanges=protectedBrandRanges(source);
  let m;
  while((m=re.exec(source))){
    const start=m.index,end=start+m[0].length;
    const before=start>0?source[start-1]:'';
    const after=end<source.length?source[end]:'';
    // Do not create partial-word anchors such as linking "certified" inside a
    // longer token. Unicode letters/numbers count as word characters here.
    if((before&&/[\p{L}\p{N}]/u.test(before))||(after&&/[\p{L}\p{N}]/u.test(after))) continue;
    if(brandRanges.some(([a,b])=>start<b&&end>a)) continue;
    return {start,end,match:m[0]};
  }
  return null;
}

// Backwards-compatible helper for audits/older callers.
export function findContextualMatch(text, phrase, lang='en'){
  const span=findContextualSpan(text,phrase,lang);
  return span?span.start:-1;
}
