const fs=require('fs');
const page=fs.readFileSync('app/[lang]/services/[slug]/page.js','utf8');
const css=fs.readFileSync('app/globals.css','utf8');
let e=[];
if(page.includes('className="related"')||page.includes('<h2>{L.links}</h2>')) e.push('old related-services block still rendered');
if(!page.includes('r.slug===slug')) e.push('self-link guard missing');
if(!page.includes('`/${lang}/services/${r.slug}`')) e.push('same-language contextual href missing');
if(!page.includes('renderText(x.a)')) e.push('FAQ answers not contextual-link enabled');
if(!page.includes('renderText(content?.intro)')) e.push('body content not contextual-link enabled');
if(!css.includes('--internal-link-color:')||!css.includes('--internal-link-hover-color:')) e.push('central link theme variables missing');
if(!css.includes('.internal-link{')) e.push('contextual link class missing');
console.log(`Contextual internal-link audit: ${e.length?'FAIL':'PASS'}`); if(e.length){console.log(e.join('\n'));process.exit(1)}
console.log('PASS: no rendered related-services block; self-link guard; same-language URLs; body+FAQ contextual linking; centralized theme colors.');
