local response = gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/TeelaLogin_users.lua")

if not response or not response.content then
    gg.alert("❌ Erro ao acessar a lista de usuários.")
    os.exit()
end

local success, err = pcall(load(response.content))
if not success then
    gg.alert("❌ Erro ao carregar usuários: " .. tostring(err))
    os.exit()
end

function data_para_numero(data)
    local dia, mes, ano = data:match("(%d%d)/(%d%d)/(%d%d%d%d)")
    if dia and mes and ano then
        return tonumber(ano .. mes .. dia)
    end
    return 0
end

function login()
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
            gg.toast("✅ Login bem-sucedido! Bem-vindo, " .. usuario)
                    return usuario, dados
                else
                    gg.alert("❌ Sua conta expirou em " .. dados.expira_em)
                    return login()
                end
            else
                gg.alert("❌ Senha incorreta.")
                return login()
            end
        else
            gg.alert("❌ Usuário não encontrado.")
            return login()
        end
    end
end

return login()
