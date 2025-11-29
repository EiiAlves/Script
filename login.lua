usuario = nil
dados = {}

-- Arquivo para armazenar o status do login
 loginStatusFile = "/storage/emulated/0/DCIM/loginStatus.txt"

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

-- Função para verificar se o arquivo existe
function arquivoExiste(caminho)
    local file = io.open(caminho, "r")
    if file then
        file:close()
        return true
    end
    return false
end

-- Função para ler o status do login
function lerStatusLogin()
    if not arquivoExiste(loginStatusFile) then
        return nil -- Retorna nil se o arquivo não existir
    end

 local file = io.open(loginStatusFile, "r")
    if file then
        local usuarioSalvo = file:read("*l") -- Lê o nome do usuário
        local timestamp = file:read("*l")   -- Lê o timestamp
        file:close()

        -- Verifica se o timestamp é válido
        if usuarioSalvo and timestamp and tonumber(timestamp) then
            local currentTime = os.time()
            local tempoLimite = 7 * 24 * 60 * 60 -- 1 semana (em segundos)
            if currentTime - tonumber(timestamp) < tempoLimite then
                return usuarioSalvo, timestamp
            end
        end
    end
    return nil
end

-- Função para salvar o status do login
 function salvarStatusLogin(usuario)
    local file = io.open(loginStatusFile, "w")
    if file then
        local currentTime = os.time()
        file:write(usuario .. "\n" .. currentTime)
        file:close()
    end
end

-- Função para fazer logout
function fazerLogout()
    -- Deleta o arquivo de status
    if arquivoExiste(loginStatusFile) then
        os.remove(loginStatusFile)
    end
    gg.toast("Saindo 🏃🏼‍♂️")
    -- Retorna para a tela de login
    os.exit()
end

-- Função de login
function login()
    -- Verifica se o usuário já está logado recentemente
    local usuarioSalvo, timestamp = lerStatusLogin()
    if usuarioSalvo then
        gg.alert("✅ Bem-vindo de volta!\n\n\n " .. usuarioSalvo .. "\n")
        usuario = usuarioSalvo
        dados = TeelaLogin_users[usuario]
        return
    end

    -- Interface de login aprimorada
    gg.toast("🔒 Tela de Login")
    local input = gg.prompt(
        {"█▓▒­░⡷⠂👤ᴜꜱᴜᴀʀɪᴏ👤⠐⢾░▒▓█:", "█▓▒­░⡷⠂🔒ꜱᴇɴʜᴀ🔒⠐⢾░▒▓█:", "\b\b\bᴍᴀɴᴛᴇɴʜᴀ-ᴍᴇ ᴄᴏɴᴇᴄᴛᴀᴅᴏ"}, 
        nil, 
        {"text", "text", "checkbox"}
    )

    if input == nil then
        gg.alert("❌ Operação cancelada.")
        return
    end

    usuario = input[1]
    local senha = input[2]
    local manterLogado = input[3]

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
        gg.alert("✅ Login bem-sucedido!")
        if manterLogado then
            salvarStatusLogin(usuario) -- Salva o status do login
        end
  
    else
        gg.alert("❌ Sua conta expirou em: " .. dados.expira_em)
        os.exit()
    end
end
login()
