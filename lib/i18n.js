import langs from './langs.json';
export const LANGS = langs;
export const CODES = langs.map((l) => l.code);
export const RTL = ['ar'];
export const DOMAIN = 'https://poadubai.eu';
export const WA = '971528997280';
export const MAIL = 'info@poainminutes.ae';
export const SLUGS = ['power-of-attorney-from-abroad', 'eviction-notice-dubai', 'mofa-attestation-abroad'];
export async function getM(lang) {
  return (await import(`../messages/${lang}.json`)).default;
}
export const fmt = (d, l) => new Date(d).toLocaleDateString(l, { year: 'numeric', month: 'long', day: 'numeric' });
export const waLink = (m) => `https://wa.me/${WA}?text=${encodeURIComponent('Poa Dubai — ' + m.wa)}`;
