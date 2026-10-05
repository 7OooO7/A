'use client';

export default function FloatingActions({ whatsappLabel = 'WhatsApp' }) {
  const number = process.env.NEXT_PUBLIC_WHATSAPP_NUMBER || '';
  const waHref = number ? `https://wa.me/${number.replace(/\D/g, '')}` : null;

  return (
    <div className="floating-actions" aria-label="Quick actions">
      <button className="float-action top-action" type="button" onClick={() => window.scrollTo({ top: 0, behavior: 'smooth' })} aria-label="Back to top" title="Back to top">
        <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M6.7 14.7 12 9.4l5.3 5.3 1.4-1.4L12 6.6l-6.7 6.7 1.4 1.4Z"/></svg>
      </button>
      {waHref ? <a className="float-action whatsapp-action" href={waHref} target="_blank" rel="noopener noreferrer" aria-label={whatsappLabel} title={whatsappLabel}><svg viewBox="0 0 32 32" aria-hidden="true"><path d="M27.3 4.7A15.8 15.8 0 0 0 2.5 23.8L.3 31.7l8.1-2.1A15.8 15.8 0 0 0 27.3 4.7ZM16 29a13 13 0 0 1-6.6-1.8l-.5-.3-4.8 1.3 1.3-4.7-.3-.5A13 13 0 1 1 16 29Zm7.1-9.7c-.4-.2-2.3-1.1-2.6-1.3-.4-.1-.6-.2-.9.2-.3.4-1 1.3-1.3 1.6-.2.3-.5.3-.9.1-2.3-1.1-3.8-2-5.3-4.6-.4-.7.4-.7 1.1-2.2.1-.3.1-.6 0-.8l-1.2-3c-.3-.8-.7-.7-.9-.7h-.8c-.3 0-.8.1-1.1.5-.4.4-1.5 1.5-1.5 3.6s1.5 4.1 1.7 4.4c.2.3 3 4.6 7.3 6.4 2.7 1.2 3.7 1.3 5 1.1 1.5-.2 2.3-1.5 2.6-2.1.3-.6.3-1.2.2-1.3-.1-.2-.4-.3-.8-.5Z"/></svg></a> : <span className="float-action whatsapp-action whatsapp-disabled" aria-disabled="true"><svg viewBox="0 0 32 32" aria-hidden="true"><path d="M27.3 4.7A15.8 15.8 0 0 0 2.5 23.8L.3 31.7l8.1-2.1A15.8 15.8 0 0 0 27.3 4.7ZM16 29a13 13 0 0 1-6.6-1.8l-.5-.3-4.8 1.3 1.3-4.7-.3-.5A13 13 0 1 1 16 29Z"/></svg></span>}
    </div>
  );
}
