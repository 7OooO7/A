export const BRAND = {
  name: 'POA Dubai',
  descriptor: 'Worldwide · Dubai · UAE',
  domain: 'https://poadubai.eu',
  email: 'info@poadubai.eu',
  phone: process.env.NEXT_PUBLIC_PHONE_NUMBER || '',
};

export { SERVICE_SLUGS } from './serviceCatalog';
export { getEnabledServiceSlugs, isServiceEnabled, isGroupEnabled } from './serviceAvailability';
