import { NextResponse } from 'next/server';
export const runtime='nodejs';
export async function POST(request){
 try {
  const size=Number(request.headers.get('content-length')||0);if(size>12000)return NextResponse.json({error:'Too large'},{status:413});
  const data=await request.json();
  const clean=(v,max)=>typeof v==='string'?v.trim().slice(0,max):'';
  const name=clean(data.name,120),email=clean(data.email,254),message=clean(data.message,5000);
  if(!name||!message||!/^\S+@\S+\.\S+$/.test(email))return NextResponse.json({error:'Invalid input'},{status:400});
  const key=process.env.RESEND_API_KEY,from=process.env.CONTACT_FROM_EMAIL,to=process.env.CONTACT_TO_EMAIL;
  if(!key||!from||!to)return NextResponse.json({error:'Email service not configured'},{status:503});
  const lines=[['Name',name],['Email',email],['Phone',clean(data.phone,40)],['Location',clean(data.location,120)],['Service',clean(data.service,150)],['Language',clean(data.lang,10)],['Message',message]];
  const result=await fetch('https://api.resend.com/emails',{method:'POST',headers:{Authorization:`Bearer ${key}`,'Content-Type':'application/json'},body:JSON.stringify({from,to:[to],subject:'POA Dubai — website enquiry',text:lines.map(([k,v])=>`${k}: ${v}`).join('\n'),reply_to:email})});
  if(result.status >= 200 && result.status < 300)return NextResponse.json({ok:true});
  if(!result.ok)return NextResponse.json({error:'Delivery failed'},{status:502});
  return NextResponse.json({ok:true});
 }catch{return NextResponse.json({error:'Invalid request'},{status:400});}
}
