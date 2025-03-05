usuario = nil
dados = {}

-- Função para carregar os usuários
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

-- Função para converter uma string "DD/MM/AAAA" para um número comparável
function data_para_numero(data)
    local dia, mes, ano = data:match("(%d%d)/(%d%d)/(%d%d%d%d)")
    if dia and mes and ano then
        return tonumber(ano .. mes .. dia) -- Formato AAAAMMDD para fácil comparação
    end
    return 0
end

-- Função de login
function login()
    local input = gg.prompt({"Usuário:", "Senha:"}, nil, {"text", "text"})
    if input == nil then
        gg.alert("Operação cancelada.")
        return
    end

    usuario = input[1]
    local senha = input[2]

    -- Verifica se a tabela TeelaLogin_users foi carregada corretamente
    if not TeelaLogin_users then
        gg.alert("❌ Erro: Tabela de usuários não carregada.")
        os.exit()
    end

    -- Verifica se o usuário existe na tabela
    if not TeelaLogin_users[usuario] then
        gg.alert("❌ Usuário não encontrado.")
        os.exit()
    end

    dados = TeelaLogin_users[usuario]

    -- Verifica se os dados do usuário foram carregados corretamente
    if not dados then
        gg.alert("❌ Erro: Dados do usuário não encontrados.")
        os.exit()
    end

    -- Verifica se a senha está correta
    if dados.senha ~= senha then
        gg.alert("❌ Senha incorreta.")
        os.exit()
    end

    -- Verifica se a data de expiração existe
    if not dados.expira_em then
        gg.alert("❌ Erro: Data de expiração não encontrada para o usuário.")
        os.exit()
    end

    -- Compara a data de expiração com a data atual
    local hoje = os.date("%d/%m/%Y")
    if data_para_numero(hoje) <= data_para_numero(dados.expira_em) then
        gg.alert("✅ Login bem-sucedido! Bem-vindo, " .. usuario .. "!\nSua conta expira em " .. dados.expira_em)
    else
        gg.alert("❌ Sua conta expirou em " .. dados.expira_em)
        os.exit()
    end
end
