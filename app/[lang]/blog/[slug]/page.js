import Link from 'next/link';
import { notFound } from 'next/navigation';
import { getM, MAIL, RTL, DOMAIN } from '../../../../lib/i18n';
import { BRAND } from '../../../../lib/brand';
import { getArticle, getBlogRoutes, getArticleAlternates, formatBlogDate, safeBlogJsonLd } from '../../../../lib/blog';
import BlogContent from '../../../../components/BlogContent';

export const dynamicParams = false;
export const generateStaticParams = () => getBlogRoutes();

export async function generateMetadata({ params }) {
  const { lang, slug } = await params;
  const post = getArticle(slug,lang);
  if (!post) notFound();
  const title = post.seoTitle || `${post.title} | ${BRAND.name}`;
  const description = post.seoDescription || post.description;
  const images = /\.svg(?:$|\?)/i.test(post.image) ? undefined : [{url:new URL(post.image,DOMAIN).href,alt:post.imageAlt || post.title}];
  return {
    title,description,
    alternates:{canonical:`/${lang}/blog/${slug}`,languages:getArticleAlternates(slug,DOMAIN)},
    openGraph:{title,description,url:`${DOMAIN}/${lang}/blog/${slug}`,type:'article',siteName:BRAND.name,locale:lang.replace('-','_'),publishedTime:post.publishedAt,modifiedTime:post.updatedAt,authors:[post.author || BRAND.name],...(images ? {images} : {})},
    twitter:{card:images ? 'summary_large_image' : 'summary',title,description,...(images ? {images:[images[0].url]} : {})},
    robots:{index:true,follow:true},
  };
}

export default async function Article({ params }) {
  const { lang, slug } = await params;
  const post = getArticle(slug,lang);
  if (!post) notFound();
  const m = await getM(lang);
  const url = `${DOMAIN}/${lang}/blog/${slug}`;
  const ld = {
    '@context':'https://schema.org','@type':'Article',headline:post.title,description:post.description,inLanguage:lang,
    datePublished:post.publishedAt,dateModified:post.updatedAt,image:new URL(post.image,DOMAIN).href,
    author:post.author ? {'@type':'Person',name:post.author} : {'@type':'Organization',name:BRAND.name},
    publisher:{'@type':'Organization',name:BRAND.name},mainEntityOfPage:{'@type':'WebPage','@id':url},
  };
  return <main id="main-content" className="w">
    <article id="art">
      <Link className="back" href={`/${lang}/blog`}>{RTL.includes(lang) ? '→ ' : '← '}{m.blogLabel}</Link>
      <div className="bi"><img src={post.image} alt={post.imageAlt || post.title} width="400" height="225" style={{display:'block',width:'100%',height:'auto',aspectRatio:'400 / 225',objectFit:'cover'}} /></div>
      <div className="bm">{post.author || 'POA DUBAI'} &nbsp;·&nbsp; <time dateTime={post.publishedAt}>{formatBlogDate(post.publishedAt,lang)}</time></div>
      <h1>{post.title}</h1>
      <p className="lead">{post.description}</p>
      <BlogContent content={post.content} />
      <a className="btn p" href={`mailto:${MAIL}?subject=POA%20Dubai%20Request`}>{m.wa}</a>
      <script type="application/ld+json" dangerouslySetInnerHTML={{__html:safeBlogJsonLd(ld)}} />
    </article>
  </main>;
}
