import { PAY } from '../lib/art';
import { MAIL, WA } from '../lib/i18n';

export default function Footer({ m }) {
  return (
    <footer id="contact">
      <b>POA DUBAI</b><br />
      <span>{m.legal}</span><br />
      Office BC-892948, 26th Floor, Amber Gem Tower, Sheikh Khalifa Street, Ajman, UAE<br />
      <a href={`https://wa.me/${WA}`} target="_blank" rel="noopener noreferrer">+971 52 899 7280</a>
      {' · '}
      <a href={`mailto:${MAIL}`}>{MAIL}</a>
      <div className="pay">
        <small>{m.payLabel}</small>
        <div dangerouslySetInnerHTML={{ __html: PAY }} />
      </div>
    </footer>
  );
}
