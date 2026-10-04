const fs=require('fs'); const path=require('path');
const ui=require('../lib/uiCopy.json'); const research=require('../lib/serviceResearch.json');
const locales=Object.keys(ui); const fields=['shortDescription','intro','what','howHelp','beforeYouStart','remote'];
let errors=[];
for(const [slug,item] of Object.entries(research)) for(const lang of locales){
 if(lang==='en') continue; const c=item[lang];
 if(!c) {errors.push(`${lang}/${slug}: missing localized content`);continue;}
 for(const f of fields) if(!c[f]||!String(c[f]).trim()) errors.push(`${lang}/${slug}: missing ${f}`);
}
const files=['app/[lang]/services/[slug]/page.js','app/[lang]/page.js','app/[lang]/contact/page.js','app/[lang]/faq/page.js','components/Footer.js','components/Header.js'];
const forbidden=["lang==='ar'?","lang === 'ar' ?","Depending on the document and receiving authority","We coordinate the process and documents.","What does this service cover?","Questions clients commonly ask"];
for(const f of files){const s=fs.readFileSync(f,'utf8'); for(const x of forbidden) if(s.includes(x)) errors.push(`${f}: hard-coded bilingual fallback: ${x}`)}
if(errors.length){console.error(errors.join('\n'));process.exit(1)}
console.log(`Visible-localization audit passed: ${locales.length} locales × ${Object.keys(research).length} services have localized content fields; no known Arabic/English binary fallback remains in core UI.`)
