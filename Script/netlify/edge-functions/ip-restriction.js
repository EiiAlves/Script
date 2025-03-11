export default async (request, context) => {
  const ALLOWED_IP = "177.185.45.211"; // Atualize novamente!
  const CLIENT_IP = context.ip;

  // Log detalhado (aparecerá em Edge Functions > Logs)
  console.log("========= INÍCIO DA REQUISIÇÃO =========");
  console.log("IP Detectado:", CLIENT_IP);
  console.log("IP Permitido:", ALLOWED_IP);
  console.log("User-Agent:", request.headers.get("user-agent"));

  if (CLIENT_IP !== ALLOWED_IP) {
    console.log("🚫 Acesso bloqueado!");
    return new Response(`
      <h1>Acesso Negado</h1>
      <p>Seu IP (${CLIENT_IP}) não está na lista de permissões.</p>
    `, { 
      status: 403, 
      headers: { "Content-Type": "text/html" } 
    });
  }

  console.log("✅ Acesso permitido!");
  return await context.next();
};
