local m = gg.getTargetInfo()
if m.x64 == true then
    Xbit = 'x64 '
else
    Xbit = 'x32 '
end 

gg.setVisible(false)

local info = gg.getTargetInfo()
local Package = info.packageName
local Version = info.versionName

if Package ~= "com.ariel.zanyants" then
    gg.alert("Jogo não suportado! Fechando o GameGuardian.")
    os.exit()
end

local InfoGame = '\n-- Package  -------->  ' .. Package ..
                 '\n-- Version  -------->  ' .. Version ..
                 '\n-- Arch   -------->  ' .. Xbit ..
                 '\n---------------------------------------------------------'

-- Baixa e executa a API
local apiUrl = "https://raw.githubusercontent.com/kruvcraft21/GGIl2cpp/master/build/Il2cppApi.lua"
local apiContent = gg.makeRequest(apiUrl).content
if not apiContent or apiContent == "" then
    gg.alert("Erro ao baixar Il2cppApi.lua")
    os.exit()
end

local apiFile = io.open("Il2cppApi.lua", "w+")
apiFile:write(apiContent)
apiFile:close()

require('Il2cppApi')
Il2cpp({il2cppVersion = 27})
gg.setVisible(false)

-- Definição de Classes e Métodos
local MovePlayer = 'MovePlayer'
local PopulateMap = 'PopulateMap'
local Bee = 'Bee'

local StartBee = 'StartBeeMode'
local UpdateMovePlayer = 'Update'
local EndBee = 'EndBeeMode'

local Fsearch = Il2cpp.FindMethods({StartBee, UpdateMovePlayer, EndBee})

-- Debug para verificar se encontrou métodos
gg.alert("Métodos encontrados: " .. tostring(#Fsearch))

local MethodMap = {
    [1] = {"StartBee", "MovePlayer"},
    [2] = {"UpdateMovePlayer", "MovePlayer"},
    [3] = {"EndBee", "MovePlayer"},
}

local Results = {}

for index, method in ipairs(Fsearch) do
    local varName, className = table.unpack(MethodMap[index])
    
    for _, v in ipairs(method) do
        if v.ClassName == className then
            Results[varName] = "0x" .. v.Offset
            break
        end
    end
end

-- Criando a BaseTable de forma dinâmica
local BaseTable = "\n" .. InfoGame
for varName, offset in pairs(Results) do
    BaseTable = BaseTable .. "\n" .. varName .. "=" .. offset
end

-- Função para enviar os offsets para o servidor
local function sendOffsetsToServer()
    local url = "https://fabicplay.x10.bz/receive_offsets.php"

    local params = ""
    for key, value in pairs(Results) do
        params = params .. key .. "=" .. value .. "&"
    end
    params = params:sub(1, -2) -- Remove o último "&"

    -- Envia como GET, pois POST pode não ser suportado corretamente
    local response = gg.makeRequest(url .. "?" .. params)

    if response and response.code == 200 then
        gg.toast("Offsets enviados com sucesso para o servidor!")
    else
        gg.toast("Erro ao enviar offsets para o servidor.")
    end
end

sendOffsetsToServer()
