import json,re
from pathlib import Path
p=Path('lib/serviceResearch.json'); d=json.loads(p.read_text())
# English commercial query families verified against competitor usage; localized pages retain native terms and these recognized UAE service terms where relevant.
def family(slug,cat,title):
    kws=[]
    def add(*xs):
      for x in xs:
       if x and x not in kws:kws.append(x)
    if cat in ('poa','property','vehicle') or slug in ['corporate-power-of-attorney','company-incorporation-poa','company-management-poa','company-shares-poa','vat-tax-poa']:
      add('POA','Power of Attorney')
    if cat=='poa': add('POA Dubai','POA UAE','UAE Power of Attorney','online POA','remote POA')
    if cat=='property': add('Property POA','Property Power of Attorney','Dubai property POA','DLD')
    if cat=='vehicle': add('Vehicle POA','Vehicle Power of Attorney','RTA')
    if slug.startswith('company-') or slug=='corporate-power-of-attorney': add('Business POA','Corporate POA')
    if slug in ('moa-drafting-notarisation','moa-amendment'): add('MOA','Memorandum of Association','MOA UAE','MOA notarisation')
    if slug in ('document-legalisation','uae-document-attestation'): add('MOFA Attestation','UAE attestation','document attestation','document legalisation')
    if slug in ('certified-translation',): add('Legal Translation','Certified Translation','MOJ-certified translation','Arabic legal translation')
    if slug in ('notarisation','contract-notarisation','e-notary-dubai','fast-track-notary'): add('Notary Public Dubai','UAE notarisation','e-notary','online notarisation')
    if slug=='certified-true-copy': add('Certified True Copy','notarised copy')
    if slug=='apostille': add('Apostille Sweden','Swedish document apostille','Hague Apostille')
    if slug=='dubai-land-department-services': add('DLD','Dubai Land Department','DLD services')
    if slug=='poa-online-notarisation': add('POA online notarisation','e-notarization','online POA Dubai')
    if slug=='power-of-attorney-from-abroad': add('POA from abroad','non-resident POA','remote POA UAE')
    if slug=='poa-revocation-cancellation': add('POA revocation','POA cancellation','revoke Power of Attorney')
    if slug=='board-resolution-notarisation': add('Board Resolution Notarisation','notarised board resolution','UAE corporate documents')
    if slug=='share-sale-assignment': add('Share Sale Agreement UAE','share assignment UAE','corporate document notarisation')
    if slug=='contract-addendum': add('Contract Addendum UAE','contract amendment Dubai','notarised addendum')
    if slug=='sales-assignment-contracts': add('Sales Contract UAE','Assignment Agreement UAE','contract notarisation Dubai')
    if slug=='affidavits-declarations': add('Affidavit UAE','Declaration Dubai','notarised declaration')
    if slug=='debt-acknowledgement': add('Debt Acknowledgement UAE','debt declaration Dubai','notarised debt acknowledgement')
    if slug=='signature-declaration': add('Signature Declaration UAE','signature acknowledgement','notarised signature declaration')
    if slug=='residency-accommodation-declaration': add('Accommodation Declaration UAE','residency declaration Dubai','notarised declaration')
    if slug=='waiver-declaration': add('Waiver Declaration UAE','notarised waiver Dubai','relinquishment declaration')
    if slug=='legal-notices': add('Legal Notice UAE','notarised legal notice Dubai','POA cancellation notice')
    if slug=='non-muslim-wills': add('Non-Muslim Will UAE','Dubai will','will revocation UAE')
    if slug=='document-verification': add('Document Verification UAE','document requirements check','UAE document acceptance')
    if slug=='document-processing': add('Document Processing UAE','document clearing services','UAE document services')
    if slug=='international-courier': add('International Document Courier','document courier UAE','original document delivery')
    if slug=='company-contract-termination': add('Company Contract Termination UAE','contract cancellation Dubai','corporate documents UAE')
    if slug=='company-liquidation-documents': add('Company Liquidation UAE','liquidation documents Dubai','corporate resolution UAE')
    if slug=='property-gift-transfer': add('Property Gift Transfer Dubai','DLD property transfer','Dubai property transfer')
    if slug=='property-conveyancing-coordination': add('Dubai Conveyancing','Property Conveyancing UAE','Dubai property transfer')
    return kws

langs={'sv':54,'de':54,'fr':54,'nl':54,'da':54,'no':54,'fi':54,'es':54,'it':54,'pt':54,'pl':54,'ro':54,'el':54,'cs':54,'hu':54,'bg':54,'hr':54,'sk':54,'sl':54,'et':24}
for slug,item in d.items():
    cat=item.get('category',''); title=item.get('en',{}).get('title') or item.get('research',{}).get('primaryKeyword','')
    fam=family(slug,cat,title)
    item['keywordMap']={'commercialVariants':fam,'intentModifiers':['Dubai','UAE','online','remote','from abroad','non-resident']}
    for lang,n in langs.items():
      # only pages counted as reviewed
      idx=list(d).index(slug)
      if idx>=n: continue
      c=item.get(lang)
      if not isinstance(c,dict):continue
      native=c.get('title','')
      existing=c.get('keywords',[]) if isinstance(c.get('keywords'),list) else []
      localized=[native, f'{native} Dubai', f'{native} UAE'] if native else []
      c['keywords']=list(dict.fromkeys([x for x in localized+fam+existing if x]))[:18]
      c['keywordVariants']=fam
      # Add a natural commercial-term sentence once, not keyword stuffing.
      if fam:
        lead=fam[0]
        intro=c.get('intro','')
        if lead.lower() not in intro.lower():
          bridges={
           'sv':f' I internationella UAE-ärenden används även söktermen {lead} för denna typ av tjänst.',
           'de':f' Bei internationalen VAE-Vorgängen wird für diese Leistung auch der Such- und Fachbegriff {lead} verwendet.',
           'fr':f' Dans les démarches internationales liées aux Émirats, cette prestation est également recherchée sous le terme {lead}.',
           'nl':f' Bij internationale VAE-zaken wordt voor deze dienst ook de gangbare zoekterm {lead} gebruikt.',
           'da':f' I internationale UAE-sager bruges også den almindelige søgeterm {lead} om denne type ydelse.',
           'no':f' I internasjonale UAE-saker brukes også den vanlige søketermen {lead} om denne typen tjeneste.',
           'fi':f' Kansainvälisissä UAE-asioissa tästä palvelusta käytetään myös yleistä hakutermiä {lead}.',
           'es':f' En trámites internacionales relacionados con EAU, este servicio también se busca habitualmente como {lead}.',
           'it':f' Nelle pratiche internazionali relative agli EAU, questo servizio viene cercato anche con il termine {lead}.',
           'pt':f' Em processos internacionais relacionados com os EAU, este serviço também é pesquisado pelo termo {lead}.',
           'pl':f' W międzynarodowych sprawach dotyczących ZEA ta usługa jest również wyszukiwana pod terminem {lead}.',
           'ro':f' În procedurile internaționale legate de EAU, acest serviciu este căutat și prin termenul {lead}.',
           'el':f' Σε διεθνείς υποθέσεις που αφορούν τα ΗΑΕ, η υπηρεσία αναζητείται επίσης με τον όρο {lead}.',
           'cs':f' V mezinárodních záležitostech týkajících se SAE se tato služba vyhledává také pod termínem {lead}.'}
          c['intro']=intro+bridges.get(lang,'')
p.write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n')
