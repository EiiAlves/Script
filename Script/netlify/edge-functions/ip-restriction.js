export default async (request, context) => {
     const ALLOWED_IP = "177.185.45.211"; // Ex: "189.152.45.67"
     const CLIENT_IP = context.ip;

     if (CLIENT_IP !== ALLOWED_IP) {
       return new Response("Acesso bloqueado. IP não autorizado.", { 
         status: 403,
         headers: { "Content-Type": "text/html" }
       });
     }

     return await context.next(); // Permite acesso se o IP for válido
   };