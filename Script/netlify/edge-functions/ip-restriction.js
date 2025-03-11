export default async (request, context) => {
       const ALLOWED_IP = "177.185.45.211";
       const CLIENT_IP = context.ip;

       // Log para depuração
       console.log("IP do cliente:", CLIENT_IP);
       console.log("Comparando com IP permitido:", ALLOWED_IP);

       if (CLIENT_IP !== ALLOWED_IP) {
         console.log("Acesso bloqueado para IP:", CLIENT_IP);
         return new Response("Acesso bloqueado. IP não autorizado.", {
           status: 403,
           headers: { "Content-Type": "text/html" }
         });
       }

       console.log("Acesso permitido para IP:", CLIENT_IP);
       return await context.next();
     };
