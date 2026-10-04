# Poa Dubai (Next.js)

Next.js 15 (App Router), 32 languages, static generation per language.

    npm install
    npm run dev      # http://localhost:3000  (redirects / to the visitor's language)
    npm run build && npm start

- app/[lang]/ : home (services, FAQ), blog list, blog article pages (real URLs)
- messages/xx.json : all texts per language (edit here)
- middleware.js : sends / to the language from the browser's Accept-Language (fallback: en)
- app/sitemap.js, app/robots.js : sitemap with hreflang alternates, robots (domain poadubai.eu)
- lib/art.js : blog illustrations, publish dates (BD), payment marks (PAY) -> replace with the official logos
- Header logo (components/Header.js) is a placeholder: replace with the original SVG.
- Not built or tested in the environment where this was generated: run `npm run build` first.
