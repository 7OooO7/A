const fs=require('fs');
const data=JSON.parse(fs.readFileSync('lib/serviceResearch.json','utf8'));
const slugs=Object.keys(data); let errors=[], count=0;
const batch1={sv:54,de:54,fr:54,nl:54,da:54};
const batch2={no:46,fi:46,es:46,it:46,pt:46};
const markers=[/Can I /,/What documents/,/Does the document/,/Will the receiving/,/What can cause/,/Coordination for /,/In practical terms/,/We start with /,/Before anything/,/Remote handling/];
function check(lang,n){for(const slug of slugs.slice(0,n)){count++; const c=data[slug]?.[lang]; if(!c){errors.push(`${lang}/${slug}: missing`);continue;} for(const k of ['title','shortDescription','intro','what','howHelp','beforeYouStart','remote']) if(!c[k]||c[k].length<(k==='title'?3:30)) errors.push(`${lang}/${slug}: ${k}`); if(!Array.isArray(c.faq)||c.faq.length<5) errors.push(`${lang}/${slug}: faq`); if(!Array.isArray(c.keywords)||c.keywords.length<3) errors.push(`${lang}/${slug}: keywords`); const blob=JSON.stringify(c); for(const re of markers) if(re.test(blob)) errors.push(`${lang}/${slug}: English fallback ${re}`);}}
for(const [l,n] of Object.entries(batch1)) check(l,n); for(const [l,n] of Object.entries(batch2)) check(l,n);
console.log(`Reviewed pages checked: ${count}`); console.log(`Errors: ${errors.length}`); if(errors.length){console.log(errors.slice(0,120).join('\n'));process.exit(1)} console.log('PASS: 500 reviewed service/language pages.');
