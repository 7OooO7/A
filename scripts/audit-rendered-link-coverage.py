import json,re,unicodedata
from pathlib import Path
root=Path(__file__).resolve().parents[1]
D=json.load(open(root/'lib/serviceResearch.json',encoding='utf8'))
langs=json.load(open(root/'lib/langs.json',encoding='utf8'))
langs=[x['code'] for x in langs]
ar=json.load(open(root/'lib/serviceTitles.ar.json',encoding='utf8'))
cat=(root/'lib/serviceCatalog.js').read_text(encoding='utf8')
services=[]
for m in re.finditer(r"\['([^']+)','([^']+)','([^']+)'",cat):
    services.append((m.group(1),m.group(3)))
en=dict(services)
slugs=[s for s,_ in services]

def title(slug,lang):
    x=D[slug].get(lang,{})
    return x.get('title') or (ar.get(slug) if lang=='ar' else None) or en[slug]
def norm(s): return unicodedata.normalize('NFKC',str(s or '')).casefold()
def words(s): return re.findall(r'[^\W_]+',str(s or ''),re.UNICODE)
def protected(x): return norm(x.strip())=='poa dubai'
def variants(slug,lang,related):
    x=D[slug].get(lang) or D[slug]['en']
    raw=[title(slug,lang),*(x.get('keywords') or []),*(x.get('keywordVariants') or [])]
    full=[]
    for z in raw:
      for p in re.split(r'\s*[\/|]\s*|\s*\([^)]*\)\s*',str(z or '')):
       p=p.strip()
       if len(p)>=4 and not protected(p) and p not in full: full.append(p)
    counts={}
    for s in slugs:
      for t in set(norm(w) for w in words(title(s,lang)) if len(norm(w))>=4): counts[t]=counts.get(t,0)+1
    owners={}
    for s in related:
      for t in set(norm(w) for w in words(title(s,lang)) if len(norm(w))>=4): owners.setdefault(t,set()).add(s)
    aliases=[]
    for token in words(title(slug,lang)):
      n=norm(token)
      if len(n)>=5 and counts.get(n,0)<=8 and owners.get(n)=={slug}:
       aliases.append(token)
       if len(n)>=7:
        stemlen=max(5,min(7,len(n)-2)); aliases.append(token[:stemlen]+'*')
    out=[]
    for z in full+aliases:
      if z not in out: out.append(z)
    return sorted(out,key=len,reverse=True)
def span(text,phrase):
    if not text or not phrase or protected(phrase): return None
    isstem=phrase.endswith('*'); base=phrase[:-1] if isstem else phrase
    toks=[re.escape(x) for x in re.split(r'[\s\-]+',base.strip()) if x]
    if not toks:return None
    core=r'[\s\-‐-―]+'.join(toks)+(r'[^\W\d_]*' if isstem else '')
    pat=re.compile(core,re.I)
    brands=[(m.start(),m.end()) for m in re.finditer(r'POA\s+Dubai',text,re.I)]
    for m in pat.finditer(text):
      a,b=m.span(); before=text[a-1:a]; after=text[b:b+1]
      if before and (before.isalnum()):continue
      if after and (after.isalnum()):continue
      if any(a<y and b>x for x,y in brands):continue
      return m.group(0)
    return None
stats={}; zeros=[]
for lang in langs:
  pages=withlinks=links=0
  for slug in slugs:
    pages+=1;x=D[slug].get(lang) or D[slug]['en']; rel=[r for r in D[slug].get('related',[]) if r!=slug]
    linked=set()
    texts=[x.get(k,'') for k in ['intro','what','howHelp','beforeYouStart','remote']]+[f.get('a','') for f in (x.get('faq') or [])[:5]]
    for text in texts:
      for r in rel:
       if r in linked:continue
       for p in variants(r,lang,rel):
        if span(str(text),p): linked.add(r);links+=1;break
    if linked:withlinks+=1
    else: zeros.append((lang,slug))
  stats[lang]=(withlinks,pages,links)
print('Rendered-link opportunity/coverage audit')
for l in langs: print(f'{l}: pages with contextual links {stats[l][0]}/{stats[l][1]}, total unique destination links {stats[l][2]}')
print('ZERO_LINK_PAGES',len(zeros))
print('SAMPLE_ZEROS',zeros[:40])
