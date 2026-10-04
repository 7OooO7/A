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

const normalize=(s)=>String(s||'').toLocaleLowerCase().normalize('NFKC');
const words=(s)=>String(s||'').match(/[\p{L}\p{N}]+/gu)||[];

// Build multilingual anchors from the localized service data itself. Full
// service phrases always win. A distinctive single-word alias is allowed only
// when it identifies one related destination unambiguously and is not a common
// token across the service directory. This lets natural text such as
// "traduction", "translation" or "ترجمة" link to Certified Translation without
// maintaining 32 hand-written dictionaries.
export function buildAnchorVariants(service,lang='en',localContent=null,relatedServices=[],allServices=[]){
  const raw=[service?.title,...(localContent?.keywords||[]),...(localContent?.keywordVariants||[])];
  const full=[...new Set(raw.flatMap(x=>String(x||'').split(/\s*[\/|]\s*|\s*\([^)]*\)\s*/u)).map(x=>x.trim()).filter(x=>x.length>=4&&!isProtectedBrandPhrase(x)))];

  const allTitleTokens=new Map();
  for(const s of allServices){
    const seen=new Set(words(s.title).map(normalize).filter(t=>t.length>=4));
    for(const t of seen) allTitleTokens.set(t,(allTitleTokens.get(t)||0)+1);
  }
  const relatedTokenOwners=new Map();
  for(const s of relatedServices){
    const seen=new Set(words(s.title).map(normalize).filter(t=>t.length>=4));
    for(const t of seen){
      if(!relatedTokenOwners.has(t)) relatedTokenOwners.set(t,new Set());
      relatedTokenOwners.get(t).add(s.slug);
    }
  }
  const aliases=[];
  for(const token of words(service?.title)){
    const n=normalize(token);
    if(n.length<5) continue;
    if((allTitleTokens.get(n)||0)>8) continue; // generic directory word
    const owners=relatedTokenOwners.get(n);
    if(owners&&owners.size===1&&owners.has(service.slug)){
      aliases.push(token);
      // Inflected languages often change the ending (e.g. traduction/translation
      // equivalents in Finnish, Croatian, Latvian, Lithuanian, etc.). Add a
      // conservative unique stem matcher; it still links the complete visible word.
      if(n.length>=7){
        const stemLen=Math.max(5,Math.min(7,n.length-2));
        aliases.push(token.slice(0,stemLen)+'*');
      }
    }
  }
  return [...new Set([...full,...aliases])].sort((a,b)=>b.length-a.length);
}

// Returns the exact span to link. A service phrase written with spaces may also
// match the same phrase written with hyphens, e.g. "certified translation"
// matches "certified-translation" as one complete anchor.
export function findContextualSpan(text, phrase, lang='en'){
  if(!text||!phrase||isProtectedBrandPhrase(phrase)) return null;
  const source=String(text), clean=String(phrase).trim();
  if(!clean) return null;
  const isStem=clean.endsWith('*');
  const base=isStem?clean.slice(0,-1):clean;
  const tokens=base.split(/[\s-]+/u).filter(Boolean).map(escapeRegExp);
  if(!tokens.length) return null;
  let core=tokens.join('[\\s\\-\\u2010-\\u2015]+');
  if(isStem) core += '[\\p{L}\\p{M}]*';
  const re=new RegExp(core,'giu');
  const brandRanges=protectedBrandRanges(source);
  let m;
  while((m=re.exec(source))){
    const start=m.index,end=start+m[0].length;
    const before=start>0?source[start-1]:'';
    const after=end<source.length?source[end]:'';
    if((before&&/[\p{L}\p{N}]/u.test(before))||(after&&/[\p{L}\p{N}]/u.test(after))) continue;
    if(brandRanges.some(([a,b])=>start<b&&end>a)) continue;
    return {start,end,match:m[0]};
  }
  return null;
}

export function findContextualMatch(text, phrase, lang='en'){
  const span=findContextualSpan(text,phrase,lang);
  return span?span.start:-1;
}
