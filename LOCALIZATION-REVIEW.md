# POA Dubai localization review

- 32 locale message files present and valid JSON.
- Shared UI labels are localized for all 32 locales.
- Contact form labels and category choices are localized for all 32 locales.
- Arabic: all 54 service titles localized.
- RTL remains enabled for Arabic via the language layout.
- English hard-coded UI was removed from Home, Contact, FAQ, Footer and generic Service page.
- Apostille destination-country SEO pages remain English-only intentionally; switching language from those pages routes to the localized Apostille service page instead of showing mixed-language content.
- Old POAInMinutes/Ajman/NuVentures contact and licence strings: 0 matches.
- `npm run audit:locales` added to catch missing locale files/keys.

Important editorial QA:
The original project did not contain native translations for the 54 new service names in all 31 non-English languages. Arabic is complete in this build; other locales no longer have English hard-coded interface copy, but service-name terminology outside Arabic/English still requires native-market editorial completion before those service pages should be treated as fully localized SEO landing pages.
