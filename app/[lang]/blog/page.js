import Link from 'next/link';
import { notFound } from 'next/navigation';
import { getM, CODES, DOMAIN } from '../../../lib/i18n';
import { BRAND } from '../../../lib/brand';
import { getArticles, getBlogAlternates, formatBlogDate, safeBlogJsonLd } from '../../../lib/blog';

export async function generateMetadata({ params }) {
  const { lang } = await params;
  if (!CODES.includes(lang)) return {};
  const m = await getM(lang);
  const posts = getArticles(lang);
  const title = `${m.blogLabel} | ${BRAND.name}`;
  const description = posts[0]?.description || m.sub;
  return {
    title, description,
    alternates: {canonical:`/${lang}/blog`, languages:getBlogAlternates(DOMAIN)},
    openGraph:{title,description,url:`${DOMAIN}/${lang}/blog`,type:'website',siteName:BRAND.name},
    robots:{index:posts.length > 0,follow:true},
  };
}

export default async function Blog({ params }) {
  const { lang } = await params;
  if (!CODES.includes(lang)) notFound();
  const m = await getM(lang);
  const posts = getArticles(lang);
  const ld = {'@context':'https://schema.org','@type':'ItemList',name:m.blogLabel,itemListElement:posts.map((post, index) => ({'@type':'ListItem',position:index+1,name:post.title,url:`${DOMAIN}/${lang}/blog/${post.slug}`}))};
  return <main id="main-content" className="w">
    <section id="blog">
      <h2>{m.blogLabel}</h2>
      <div id="bll">{posts.map(post => <article className="bc" key={post.slug}>
        <div className="bi"><img src={post.image} alt={post.imageAlt || post.title} width="400" height="225" loading="lazy" style={{display:'block',width:'100%',height:'auto',aspectRatio:'400 / 225',objectFit:'cover'}} /></div>
        <div className="bm">{post.author || 'POA DUBAI'} &nbsp;·&nbsp; <time dateTime={post.publishedAt}>{formatBlogDate(post.publishedAt,lang)}</time></div>
        <h3><Link className="blog-title-link" href={`/${lang}/blog/${post.slug}`}>{post.title}</Link></h3>
        <p>{post.description}</p>
      </article>)}</div>
    </section>
    <script type="application/ld+json" dangerouslySetInnerHTML={{__html:safeBlogJsonLd(ld)}} />
  </main>;
}
