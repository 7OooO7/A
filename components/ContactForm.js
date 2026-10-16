'use client';
import { useState } from 'react';
import uiData from '../lib/uiCopy.json';
import contactCopy from '../lib/contactCopy.json';

export default function ContactForm({ c, lang }) {
  const u = uiData[lang] || uiData.en;
  const copy = contactCopy[lang] || contactCopy.en;
  const [status, setStatus] = useState('');
  const [busy, setBusy] = useState(false);

  async function submit(e) {
    e.preventDefault();
    if (busy) return;
    setBusy(true);
    setStatus('');

    const form = e.currentTarget;
    const f = new FormData(form);
    const payload = Object.fromEntries(f.entries());
    payload.lang = lang;

    try {
      const r = await fetch('/api/contact', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload),
      });

      const data = await r.json();

      if (!r.ok || data.error) {
        throw Error(data.error || 'send failed');
      }

      setStatus(copy.success);
      form.reset();
    } catch {
      setStatus(copy.error);
    } finally {
      setBusy(false);
    }
  }

  return (
    <form className="contact-form" onSubmit={submit}>
      <div className="field-row">
        <label>
          {c.name}
          <input name="name" required maxLength="120" autoComplete="name" />
        </label>
        <label>
          {c.emailField}
          <input name="email" type="email" required maxLength="254" autoComplete="email" />
        </label>
      </div>

      <div className="field-row">
        <label>
          {c.phoneField}
          <input name="phone" type="tel" maxLength="40" autoComplete="tel" />
        </label>
        <label>
          {c.location}
          <input name="location" maxLength="120" autoComplete="country-name" />
        </label>
      </div>

      <label>
        {c.service}
        <select name="service" defaultValue="">
          <option value="" disabled>{copy.chooseService}</option>
          {u.categories.map((x) => (
            <option key={x}>{x}</option>
          ))}
        </select>
      </label>

      <label>
        {c.message}
        <textarea name="message" rows="7" required maxLength="5000" />
      </label>

      <button className="btn p" type="submit" disabled={busy}>
        {busy ? copy.sending : copy.send}
      </button>

      <p className="form-note" role="status" aria-live="polite">
        {status}
      </p>
    </form>
  );
}