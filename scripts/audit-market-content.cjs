const fs=require('fs');
const data=JSON.parse(fs.readFileSync('lib/serviceResearch.json','utf8'));
const langs=['en','ar','sv','de','fr','nl','da','no','fi'];
let errors=[];
for(const [slug,item] of Object.entries(data)){
 for(const lang of langs){
  const c=item[lang];
  if(!c) errors.push(`${slug}: missing ${lang}`);
  else for(const k of ['shortDescription','intro','what','howHelp','beforeYouStart','remote','questions']) if(!c[k]) errors.push(`${slug}/${lang}: missing ${k}`);
 }
}
if(errors.length){console.error(errors.join('\n'));process.exit(1)}
console.log(`Market-content structure passed: ${Object.keys(data).length} services × ${langs.length} search-ready locales.`)
