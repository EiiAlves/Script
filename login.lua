local response = gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/TeelaLogin_users.lua")

if response and response.content then
    local success, err = pcall(load(response.content))
    
    if not success then
        gg.alert("Erro ao carregar usuários: " .. tostring(err))
        os.exit()
    end
else
    gg.alert("Erro ao acessar a lista de usuários.")
if not response or not response.content then
    gg.alert("❌ Erro ao acessar a lista de usuários.")
    os.exit()
end

local success, err = pcall(load(response.content))
if not success then
    gg.alert("❌ Erro ao carregar usuários: " .. tostring(err))
os.exit()
end

-- Converte uma string "DD/MM/AAAA" para um número comparável
function data_para_numero(data)
local dia, mes, ano = data:match("(%d%d)/(%d%d)/(%d%d%d%d)")
if dia and mes and ano then
        return tonumber(ano .. mes .. dia) -- Formato AAAAMMDD para fácil comparação
        return tonumber(ano .. mes .. dia)
end
return 0
end

function login()
    local input = gg.prompt({"Usuário:", "Senha:"}, nil, {"text", "text"})
    if input == nil then
        gg.alert("Operação cancelada.")
        login()
    end
    
    local usuario = input[1]
    local senha = input[2]
    
    if TeelaLogin_users and TeelaLogin_users[usuario] then
        local dados = TeelaLogin_users[usuario]
    while true do
        local input = gg.prompt({"👤 Usuário:", "🔑 Senha:"}, nil, {"text", "text"})
        
        if not input then
            gg.alert("⚠ Operação cancelada.")
            return login()
        end
        
        local usuario = input[1]
        local senha = input[2]
        
        if TeelaLogin_users and TeelaLogin_users[usuario] then
            local dados = TeelaLogin_users[usuario]

        if dados.senha == senha then
            local hoje = os.date("%d/%m/%Y")
            if data_para_numero(hoje) <= data_para_numero(dados.expira_em) then
                gg.alert("✅ Login bem-sucedido! Bem-vindo, " .. usuario .. "!\nSua conta expira em " .. dados.expira_em)
            if dados.senha == senha then
                local hoje = os.date("%d/%m/%Y")
                if data_para_numero(hoje) <= data_para_numero(dados.expira_em) then
                    gg.alert("✅ Login bem-sucedido! Bem-vindo, " .. usuario .. "!\nSua conta expira em " .. dados.expira_em)
                    return usuario, dados
                else
                    gg.alert("❌ Sua conta expirou em " .. dados.expira_em)
                    return login()
                end
else
                gg.alert("❌ Sua conta expirou em " .. dados.expira_em)
                os.exit()
                gg.alert("❌ Senha incorreta.")
                return login()
end
else
            gg.alert("❌ Senha incorreta.")
            os.exit()
            gg.alert("❌ Usuário não encontrado.")
            return login()
end
    else
        gg.alert("❌ Usuário não encontrado.")
        os.exit()
end
end

login()
return login()
