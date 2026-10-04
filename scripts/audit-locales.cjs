const fs=require('fs'),path=require('path');
const langs=require('../lib/langs.json').map(x=>x.code);
const ui=require('../lib/uiCopy.json');
let errors=[];
for(const l of langs){
 if(!ui[l]) errors.push(`missing UI locale ${l}`);
 const f=path.join(__dirname,'..','messages',`${l}.json`);
 if(!fs.existsSync(f)) errors.push(`missing messages/${l}.json`);
 else { try { const m=JSON.parse(fs.readFileSync(f,'utf8')); for(const k of ['h1','sub','sh','ph','st','faq','nav']) if(!m[k]) errors.push(`${l}: missing ${k}`); } catch(e){errors.push(`${l}: invalid JSON`)} }
}
const ar=require('../lib/serviceTitles.ar.json');
if(Object.keys(ar).length!==54) errors.push(`Arabic services: expected 54, got ${Object.keys(ar).length}`);
if(errors.length){console.error(errors.join('\n'));process.exit(1)}
console.log(`Localization audit passed: ${langs.length} locales, required UI keys present, Arabic 54/54 service titles.`);
