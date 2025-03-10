exports.handler = async (event, context) => {
       const clientIP = event.headers['x-nf-client-connection-ip']; // IP do usuário
       const allowedIP = "186.249.142.54"; // Substitua pelo seu IP (ex: "186.249.142.54")

       if (clientIP === allowedIP) {
         return {
           statusCode: 200,
           body: "Acesso permitido."
         };
       } else {
         return {
           statusCode: 403,
           body: "Acesso negado."
         };
       }
     };