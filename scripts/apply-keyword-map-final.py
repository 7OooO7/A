import json
from pathlib import Path
p=Path('lib/serviceResearch.json'); d=json.loads(p.read_text())
def family(slug,cat):
 k=[]
 def add(*xs):
  for x in xs:
   if x and x not in k:k.append(x)
 if cat in ('poa','property','vehicle') or slug in ['corporate-power-of-attorney','company-incorporation-poa','company-management-poa','company-shares-poa','vat-tax-poa']: add('POA','Power of Attorney')
 if cat=='poa': add('POA Dubai','POA UAE','UAE Power of Attorney','online POA','remote POA')
 if cat=='property': add('Property POA','Property Power of Attorney','Dubai property POA','DLD','Dubai Land Department')
 if cat=='vehicle': add('Vehicle POA','Vehicle Power of Attorney','RTA')
 if slug.startswith('company-') or slug=='corporate-power-of-attorney': add('Business POA','Corporate POA')
 if slug in ('moa-drafting-notarisation','moa-amendment'): add('MOA','Memorandum of Association','MOA UAE','MOA notarisation')
 if slug in ('document-legalisation','uae-document-attestation'): add('MOFA Attestation','UAE attestation','document attestation','document legalisation')
 if slug=='certified-translation': add('Legal Translation','Certified Translation','MOJ-certified translation','Arabic legal translation')
 if slug in ('notarisation','contract-notarisation','e-notary-dubai','fast-track-notary'): add('Notary Public Dubai','UAE notarisation','e-notary','online notarisation')
 if slug=='certified-true-copy': add('Certified True Copy','notarised copy')
 if slug=='apostille': add('Apostille Sweden','Swedish document apostille','Hague Apostille')
 if slug=='dubai-land-department-services': add('DLD','Dubai Land Department','DLD services')
 special={'poa-online-notarisation':['POA online notarisation','e-notarization','online POA Dubai'],'power-of-attorney-from-abroad':['POA from abroad','non-resident POA','remote POA UAE'],'poa-revocation-cancellation':['POA revocation','POA cancellation','revoke Power of Attorney'],'board-resolution-notarisation':['Board Resolution Notarisation','notarised board resolution'],'share-sale-assignment':['Share Sale Agreement UAE','share assignment UAE'],'contract-addendum':['Contract Addendum UAE','contract amendment Dubai'],'sales-assignment-contracts':['Sales Contract UAE','Assignment Agreement UAE'],'affidavits-declarations':['Affidavit UAE','Declaration Dubai'],'debt-acknowledgement':['Debt Acknowledgement UAE','debt declaration Dubai'],'signature-declaration':['Signature Declaration UAE','signature acknowledgement'],'residency-accommodation-declaration':['Accommodation Declaration UAE','residency declaration Dubai'],'waiver-declaration':['Waiver Declaration UAE','notarised waiver Dubai'],'legal-notices':['Legal Notice UAE','notarised legal notice Dubai'],'non-muslim-wills':['Non-Muslim Will UAE','Dubai will'],'document-verification':['Document Verification UAE','UAE document acceptance'],'document-processing':['Document Processing UAE','UAE document services'],'international-courier':['International Document Courier','document courier UAE'],'company-contract-termination':['Company Contract Termination UAE','contract cancellation Dubai'],'company-liquidation-documents':['Company Liquidation UAE','liquidation documents Dubai'],'property-gift-transfer':['Property Gift Transfer Dubai','DLD property transfer'],'property-conveyancing-coordination':['Dubai Conveyancing','Property Conveyancing UAE']}
 add(*special.get(slug,[])); return k
langs=['de','fr','es','it','pt','nl','pl','sv','ro','el','cs','da','fi','hu','bg','hr','sk','sl','et','lv','lt','mt','ga','no','tr','sr','uk','sq','is','ru']
for slug,item in d.items():
 fam=family(slug,item.get('category',''))
 item['keywordMap']={'commercialVariants':fam,'intentModifiers':['Dubai','UAE','online','remote','from abroad','non-resident']}
 for lang in langs+['en','ar']:
  c=item.get(lang,{})
  native=c.get('title') or item.get('research',{}).get('primaryKeyword','')
  existing=c.get('keywords',[]) if isinstance(c.get('keywords'),list) else []
  local=[native,f'{native} Dubai',f'{native} UAE'] if native else []
  c['keywords']=list(dict.fromkeys([x for x in local+fam+existing if x]))[:20]
  c['keywordVariants']=fam
p.write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n')
