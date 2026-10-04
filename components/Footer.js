import { PAY } from '../lib/art';
import { BRAND } from '../lib/brand';

export default function Footer({ m }) {
  return (
    <footer id="contact">
      <div className="footer-inner">
        <div className="footer-brand"><b>POA DUBAI</b><span>{BRAND.descriptor}</span></div>
        <div className="footer-contact"><a href={`mailto:${BRAND.email}`}>{BRAND.email}</a></div>
        <p className="footer-disclaimer">{m.footerNote || 'Document preparation and process coordination. Official notarisation, legalisation and authority actions are completed through the competent authority or appropriately licensed partner.'}</p>
        <div className="pay"><small>{m.payLabel}</small><div dangerouslySetInnerHTML={{ __html: PAY }} /></div>
      </div>
    </footer>
  );
}
