'use server';

import { Resend } from 'resend';

const resend = new Resend(process.env.RESEND_API_KEY);

export async function submitContactForm(formData: FormData) {
  const name = formData.get('name') as string;
  const email = formData.get('email') as string;
  const phone = formData.get('phone') as string;
  const location = formData.get('location') as string;
  const service = formData.get('service') as string;
  const message = formData.get('message') as string;

  if (!name || !email || !message) {
    return { success: false, error: 'Please fill in all required fields.' };
  }

  try {
    await resend.emails.send({
      from: 'info@poadubai.eu',
      to: 'info@poadubai.eu',
      replyTo: email,
      subject: `New Contact Form: ${service}`,
      text: `
Name: ${name}
Email: ${email}
Phone: ${phone || 'Not provided'}
Location: ${location || 'Not provided'}
Service: ${service}

Message:
${message}
      `,
    });

    return { success: true };
  } catch (error) {
    console.error('Email send failed:', error);
    return { success: false, error: 'Failed to send email. Please try again.' };
  }
}