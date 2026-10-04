import { SERVICE_CATEGORIES, SERVICES, serviceBySlug } from './serviceCatalog';

const legacy = ['power-of-attorney','legal-notices','attestation-legalisation'];
export function getServices(m) {
  return SERVICES.map(([slug,category,title,summary]) => ({ slug, category, title, summary, detail: summary, items: [] }));
}
export function getService(m, slug) { return serviceBySlug(slug); }
export function getCategories(){ return SERVICE_CATEGORIES; }
export function getCategoryServices(id){ return getServices({}).filter(s=>s.category===id); }
export { legacy };
