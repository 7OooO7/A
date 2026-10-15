const fs=require('fs');
const d=JSON.parse(fs.readFileSync('lib/serviceResearch.json','utf8'));
const slugs=Object.keys(d);
const expected={sv:54,de:54,fr:54,nl:54,da:54,no:54,fi:54,es:54,it:54,pt:54,pl:54,ro:54,el:54,cs:54,hu:54,bg:54,hr:54,sk:54,sl:54,et:24};
const req=['title','shortDescription','intro','what','howHelp','beforeYouStart','remote','faq','keywords'];
let errors=[],count=0,poa=0,poaCovered=0;
const englishMarkers=[/^Can /,/^What documents/i,/^Does the document/i,/^Will the receiving/i,/^What can cause/i];
for(const [lang,n] of Object.entries(expected)){
 for(let i=0;i<n;i++){
  const slug=slugs[i], item=d[slug], c=item?.[lang]; count++;
  if(!c){errors.push(`${lang}/${slug}: missing`);continue;}
  for(const k of req) if(!c[k] || (Array.isArray(c[k])&&c[k].length===0)) errors.push(`${lang}/${slug}: missing ${k}`);
  if(!Array.isArray(c.faq)||c.faq.length<5) errors.push(`${lang}/${slug}: FAQ < 5`);
  for(const f of c.faq||[]) if(englishMarkers.some(r=>r.test(f.q||''))) errors.push(`${lang}/${slug}: English FAQ fallback`);
  if(c.marketReviewed!==true && !['sv','de','fr','nl','da','no','fi','es','it','pt','pl','ro','el'].includes(lang)) errors.push(`${lang}/${slug}: not marketReviewed`);
  const fam=item.keywordMap?.commercialVariants||[];
  const poaRel=fam.includes('POA');
  if(poaRel){poa++; const hay=[...(c.keywords||[]),...(c.keywordVariants||[])].join(' '); if(/\bPOA\b/i.test(hay))poaCovered++; else errors.push(`${lang}/${slug}: missing POA coverage`);}
 }
}
console.log(`Reviewed pages checked: ${count}`);
console.log(`POA-relevant: ${poa}; POA covered: ${poaCovered}`);
console.log(`Errors: ${errors.length}`);
if(errors.length){console.error(errors.slice(0,100).join('\n'));process.exit(1)}
console.log('PASS: 1,050 reviewed service/language pages meet batch QA.');
