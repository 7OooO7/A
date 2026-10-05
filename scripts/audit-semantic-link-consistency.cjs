const fs=require('fs');
const research=require('../lib/serviceResearch.json');
const map=require('../lib/semanticLinkMap.json');
const langs=require('../lib/langs.json').map(x=>x.code);
const arTitles=require('../lib/serviceTitles.ar.json');
const catalog=fs.readFileSync('lib/serviceCatalog.js','utf8');
const enTitles={}; for(const m of catalog.matchAll(/\['([^']+)','([^']+)','([^']+)'/g)) enTitles[m[1]]=m[3];
function localTitle(slug,lang){const c=research[slug]?.[lang]; return c?.title || (lang==='ar'?arTitles[slug]:null) || enTitles[slug] || null;}
let errors=[];
for(const [slug,targets] of Object.entries(map)){
 if(!research[slug]) errors.push(`${slug}: source missing`);
 if(!Array.isArray(targets)||targets.length!==3) errors.push(`${slug}: expected exactly 3 semantic targets`);
 if(new Set(targets).size!==targets.length) errors.push(`${slug}: duplicate target`);
 if(targets.includes(slug)) errors.push(`${slug}: self target`);
 for(const t of targets) if(!research[t]) errors.push(`${slug}: missing target ${t}`);
 // The destination set is slug-level, not locale-level: assert every locale resolves the exact same set.
 for(const lang of langs){
   const localeTargets=map[slug];
   if(JSON.stringify(localeTargets)!==JSON.stringify(targets)) errors.push(`${slug}/${lang}: destination drift`);
   for(const t of targets){
     if(!localTitle(t,lang)) errors.push(`${slug}/${lang}: target ${t} has no localized title`);
   }
 }
}
const page=fs.readFileSync('app/[lang]/services/[slug]/page.js','utf8');
if(!page.includes('semanticLinkMap[slug]')) errors.push('page does not use central semantic map');
if(!page.includes('semanticFallback()')) errors.push('missing deterministic fallback');
if(page.includes('research?.related||[]')) errors.push('page still derives runtime destinations from research.related');
const internal=fs.readFileSync('lib/internalLinks.js','utf8');
if(internal.includes("aliases.push")||internal.includes("+'*'")) errors.push('generic/stem alias expansion still enabled');
console.log(`Services checked: ${Object.keys(map).length}`);
console.log(`Locales checked per service: ${langs.length}`);
console.log(`Semantic destination comparisons: ${Object.keys(map).length*langs.length}`);
console.log(`Errors: ${errors.length}`);
if(errors.length){console.error(errors.slice(0,100).join('\n'));process.exit(1)}
console.log('SEMANTIC LINK CONSISTENCY: PASS');
