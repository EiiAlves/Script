usuario = nil
dados = {}

-- Arquivo para armazenar o status do login
local loginStatusFile = "loginStatus.txt"

-- Função para carregar os usuários
local response = gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/TeelaLogin_users.lua")

if response and response.content then
    local success, err = pcall(load(response.content))
    
    if not success then
        gg.alert("❌ Erro ao carregar usuários: " .. tostring(err))
        os.exit()
    end
else
    gg.alert("❌ Erro ao acessar a lista de usuários.")
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

-- Função para ler o status do login
local function lerStatusLogin()
    local file = io.open(loginStatusFile, "r")
    if file then
        local usuarioSalvo = file:read("*l")
        local expira_em = file:read("*l")
        local timestamp = file:read("*l")
        file:close()
        local currentTime = os.time()
        local tempoLimite = 7 * 24 * 60 * 60 -- 1 semana (em segundos)
        if usuarioSalvo and expira_em and timestamp and (currentTime - tonumber(timestamp) < tempoLimite) then
            return usuarioSalvo, expira_em, timestamp
        end
    end
    return nil
end

-- Função para salvar o status do login
local function salvarStatusLogin(usuario, expira_em)
    local file = io.open(loginStatusFile, "w")
    if file then
        local currentTime = os.time()
        file:write(usuario .. "\n" .. expira_em .. "\n" .. currentTime)
        file:close()
    end
end

-- Função de login
function login()
    -- Verifica se o usuário já está logado recentemente
    local usuarioSalvo, expira_em, timestamp = lerStatusLogin()
    if usuarioSalvo then
        gg.alert("✅ Você já está logado como: " .. usuarioSalvo .. "\n\nBem-vindo de volta!")
        usuario = usuarioSalvo
        dados.expira_em = expira_em
        return
    end

    -- Interface de login aprimorada
    gg.toast("🔒 Tela de Login")
    local input = gg.prompt(
        {"Usuário:", "Senha:", "Manter logado?"}, 
        nil, 
        {"text", "text", "checkbox"}
    )

    if input == nil then
        gg.alert("❌ Operação cancelada.")
        return
    end

    usuario = input[1]
    local senha = input[2]
    local manterLogado = input[3] -- true/false, dependendo da escolha do usuário

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
        gg.alert("✅ Login bem-sucedido!\n\nBem-vindo, " .. usuario .. "!\nSua conta expira em: " .. dados.expira_em)
        if manterLogado then
            salvarStatusLogin(usuario, dados.expira_em) -- Salva o status do login
        end
    else
        gg.alert("❌ Sua conta expirou em: " .. dados.expira_em)
        os.exit()
    end
end
-- Executa o login e, se bem-sucedido, exibe o menu
login()
