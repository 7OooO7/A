import langs from './langs.json';
import { BRAND } from './brand';
export const LANGS = langs;
export const CODES = langs.map((l) => l.code);
export const RTL = ['ar'];
export const DOMAIN = BRAND.domain;
export const MAIL = BRAND.email;
export const SLUGS = ['power-of-attorney-from-abroad', 'eviction-notice-dubai', 'mofa-attestation-abroad'];
export async function getM(lang) {
  return (await import(`../messages/${lang}.json`)).default;
}
export const fmt = (d, l) => new Date(d).toLocaleDateString(l, { year: 'numeric', month: 'long', day: 'numeric' });
