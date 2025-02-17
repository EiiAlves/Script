local response = gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/TeelaLogin_users.lua")

if response and response.content then
    local success, err = pcall(load(response.content))
    if not success then
        gg.alert("Erro ao carregar usuários: " .. tostring(err))
        os.exit()
    end
else
    gg.alert("Erro ao acessar a lista de usuários.")
    os.exit()
end

function login()
    local input = gg.prompt({"Usuário:", "Senha:"}, nil, {"text", "text"})
    if input == nil then
        gg.alert("Operação cancelada.")
        login()
    end
    
    local usuario = input[1]
    local senha = input[2]
    
    if TeelaLogin_users and TeelaLogin_users[usuario] == senha then
        gg.alert("✅ Login bem-sucedido! Bem-vindo, " .. usuario .. "!")
    else
        gg.alert("❌ Usuário ou senha incorretos.")
        os.exit()
    end
end

login()
