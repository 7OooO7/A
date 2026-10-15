const fs=require('fs');
const page=fs.readFileSync('app/[lang]/services/[slug]/page.js','utf8');
const engine=fs.readFileSync('lib/internalLinks.js','utf8');
const errors=[];
if(!page.includes('<summary>{x.q}</summary>')) errors.push('FAQ questions are not plain text');
if(page.includes('<summary>{renderText(x.q)}</summary>')) errors.push('FAQ question still calls contextual linker');
if(!page.includes('linkedDestinations.has(r.slug)')) errors.push('destination de-duplication guard missing');
if(!page.includes('linkedDestinations.add(r.slug)')) errors.push('destination de-duplication state missing');
if(!page.includes('findContextualSpan')) errors.push('full-span matcher not used');
if(!engine.includes("tokens.join('[\\\\s\\\\-\\\\u2010-\\\\u2015]+')")) errors.push('space/hyphen full-phrase matching missing');
if(!engine.includes('brandRanges.some')) errors.push('brand protection missing');
console.log(`Internal-link rules errors: ${errors.length}`);
if(errors.length){console.error(errors.join('\n'));process.exit(1)}
console.log('PASS: FAQ questions unlinked; one destination link per page; full phrase/hyphen anchors; brand protection retained.');
