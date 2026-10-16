import data from '../content/reviews.json';
import styles from './ClientReviews.module.css';

export default function ClientReviews({ lang = 'en' }) {
  if (!data.enabled) return null;
  const labels = data.labels[lang] || data.labels.en;
  const reviews = data.reviews.filter(review =>
    review.enabled && review.text?.[lang]?.trim() && review.name?.trim() &&
    Number.isFinite(review.rating) && review.rating >= 0 && review.rating <= 5
  );
  if (!reviews.length) return null;
  const number = new Intl.NumberFormat(lang, { maximumFractionDigits: 1 });
  return (
    <section className={styles.section} aria-labelledby="client-reviews-title">
      <h2 id="client-reviews-title" className={styles.title}>{labels.title}</h2>
      <div className={styles.grid}>
        {reviews.map(review => (
          <figure key={review.id} className={styles.card}>
            <div className={styles.top}>
              <span className={styles.stars} aria-hidden="true" dir="ltr">
                {[0, 1, 2, 3, 4].map(i => (
                  <span key={i} className={styles.star}>
                    <span>★</span>
                    <span className={styles.fill} style={{ width: `${Math.max(0, Math.min(1, review.rating - i)) * 100}%` }}>★</span>
                  </span>
                ))}
              </span>
              <span className={styles.score}><bdi>{number.format(review.rating)} / {number.format(5)}</bdi></span>
            </div>
            <blockquote className={styles.quote}>{review.text[lang]}</blockquote>
            <figcaption className={styles.caption}>
              <bdi className={styles.name}>{review.name}</bdi>
            </figcaption>
          </figure>
        ))}
      </div>
    </section>
  );
}
