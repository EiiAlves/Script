gg.alert("⚠️ EXECUTAR NO MENU DO JOGO ⚠️")

-- Baixar APIs apenas se necessário
io.open("Il2cppApi.lua", "w+"):write(gg.makeRequest("https://raw.githubusercontent.com/kruvcraft21/GGIl2cpp/master/build/Il2cppApi.lua").content):close()
require('Il2cppApi')

Il2cpp({il2cppVersion = 27})
gg.setVisible(false)

io.open("Method_Patching_Library_V1.lua", "w+"):write(gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/Method_Patching_Library_V1.lua").content):close()
require('Method_Patching_Library_V1')

gg.alert("⚠️ ESPERE TERMINAR ⚠️")
gg.toast("ɪɴᴊᴇᴛᴀɴᴅᴏ...")
gg.sleep(1000)

-- CLASSES E MÉTODOS
local MethodMap = {
    { "GetServerTime", "LoadPuntos"},
    { "GetIp", "LoadPuntos" },
    { "AutoBan", "SaveData" },
    { "OnApplicationQuit", "SaveData" },
    { "SaveDevice", "SaveData" },
    { "SuspChambers", "SaveData" },
    { "Susp", "SaveData" }
}

-- Variáveis de controle
local OffsetsEncontradas = false
local Results = {}
local bypassExecutado = false  -- Variável para controlar a execução do Bypass
local statusFile = "bypassStatus.txt"  -- Arquivo para armazenar o status do bypass


-- Função para ler o estado do bypass e timestamp do arquivo
local function lerStatus()
    local file = io.open(statusFile, "r")
    if file then
        local status, timestamp = file:read("*l", "*l")  -- Lê o status e timestamp
        file:close()

        -- Verifica se o estado está marcado como executado e se o timestamp é recente
        local currentTime = os.time()
        local restartThreshold = 60 * 60  -- 1 hora (ajuste conforme necessário)
        if status == "true" and (currentTime - tonumber(timestamp) < restartThreshold) then
            bypassExecutado = true
        end
    end
end

-- Função para salvar o estado do bypass e timestamp no arquivo
local function salvarStatus()
    local file = io.open(statusFile, "w")
    if file then
        local currentTime = os.time()
        file:write("true\n" .. currentTime)  -- Marca como executado e armazena o timestamp atual
        file:close()
    end
end

-- Busca métodos com otimização
local function FindMethods()
    if OffsetsEncontradas then return end



    -- Criar tabela para armazenar offsets corretas
    local OffsetsParaDesativar = {}

    for _, methodInfo in ipairs(MethodMap) do
        local methodName = methodInfo[1]
        local className = methodInfo[2]

        

        -- Buscar o método exato
        local search = Il2cpp.FindMethods({ methodName })

        if search and #search > 0 then

            -- Inicializar variável para armazenar a offset correta
            local offsetCorreta = nil

            for _, method in ipairs(search[1]) do
                if method.ClassName == className then
                    local offset = "0x" .. method.Offset
                    

                    -- Sempre salva a última offset encontrada, pois muitas vezes a correta está no final
                    offsetCorreta = offset
                end
            end

            if offsetCorreta then
                OffsetsParaDesativar[methodName] = offsetCorreta
                
            
            end
      
        end
    end

    -- Se encontrou offsets, desativa todas
    if next(OffsetsParaDesativar) then
        for method, offset in pairs(OffsetsParaDesativar) do
            HackersHouse.disableMethod({
                { ['libName'] = "libil2cpp", ['offset'] = offset, ['libIndex'] = 'auto' }
            })
            
        end
        OffsetsEncontradas = true

    end
end

-- Ativa o bypass
local function Bypass()
    FindMethods()
    bypassExecutado = true  -- Marca que o Bypass foi executado
    salvarStatus()  -- Salva o estado no arquivo
    gg.toast("ʙʏᴘᴀssﾠᴀᴛɪᴠᴀᴅᴏツ")
end

-- Executar o bypass diretamente
Bypass()
