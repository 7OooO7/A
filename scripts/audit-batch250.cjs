const fs=require('fs');
const data=JSON.parse(fs.readFileSync('lib/serviceResearch.json','utf8'));
const langs=['sv','de','fr','nl','da']; const slugs=Object.keys(data).slice(0,50);
let errors=[]; let count=0;
const englishMarkers=[/Can I /,/What documents/,/Does the document/,/Will the receiving/,/What can cause/,/Coordination for /,/In practical terms/,/We start with /,/Before anything/,/Remote handling/];
for(const lang of langs) for(const slug of slugs){count++; const c=data[slug]?.[lang]; if(!c){errors.push(`${lang}/${slug}: missing`);continue;} for(const k of ['title','shortDescription','intro','what','howHelp','beforeYouStart','remote']) if(!c[k]||c[k].length<(k==='title'?3:20)) errors.push(`${lang}/${slug}: ${k}`); if(!Array.isArray(c.faq)||c.faq.length<5) errors.push(`${lang}/${slug}: faq`); const blob=JSON.stringify(c); for(const re of englishMarkers) if(re.test(blob)) errors.push(`${lang}/${slug}: English leak ${re}`);}
console.log(`Batch pages checked: ${count}`); console.log(`Errors: ${errors.length}`); if(errors.length){console.log(errors.slice(0,100).join('\n'));process.exit(1)} console.log('PASS: 250 localized service pages have titles, service content, market FAQ and no known English fallback markers.');
