import { CODES } from './i18n';
export const SEARCH_READY_LOCALES = [...CODES];
export const isSearchReady = (lang) => SEARCH_READY_LOCALES.includes(lang);
