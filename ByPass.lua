gg.clearResults()
local info = gg.getTargetInfo()
local Xbit = info.x64 and 'x64 ' or 'x32 '

gg.setVisible(false)

-- Informações do jogo
local Package = info.packageName
local Version = info.versionName
local InfoGame = string.format(
    '\n-- Package  -------->  %s\n-- Version  -------->  %s\n-- Arch   -------->  %s\n---------------------------------------------------------',
    Package, Version, Xbit
)

gg.alert("⚠️ EXECUTAR NO MENU DO JOGO ⚠️")
gg.toast("⚡ɪɴᴊᴇᴛᴀɴᴅᴏﾠʙʏᴘᴀꜱꜱ")

-- Baixar APIs apenas se necessário
    io.open("Il2cppApi.lua", "w+"):write(gg.makeRequest("https://raw.githubusercontent.com/kruvcraft21/GGIl2cpp/master/build/Il2cppApi.lua").content):close()
require('Il2cppApi')

Il2cpp({il2cppVersion = 27})
gg.setVisible(false)

    io.open("Method_Patching_Library_V1.lua", "w+"):write(gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/Method_Patching_Library_V1.lua").content):close()

require('Method_Patching_Library_V1')
gg.alert("⚠️ESPERE TERMINAR ⚠️")
gg.toast("ɪɴᴊᴇᴛᴀɴᴅᴏ...")
-- CLASSES E MÉTODOS
local MethodMap = {
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

-- Busca métodos com otimização
local function FindMethods()
    if OffsetsEncontradas then return end

    local Fsearch = Il2cpp.FindMethods({
        "GetIp", "AutoBan", "OnApplicationQuit", "SaveDevice", "SuspChambers", "Susp"
    })

    for index, method in ipairs(Fsearch) do
        local varName, className = table.unpack(MethodMap[index])

        for _, v in ipairs(method) do
            if v.ClassName == className then
                Results[varName] = "0x" .. v.Offset
                break
            end
        end
    end

    if Results["AutoBan"] then OffsetsEncontradas = true end
end

-- Ativa o bypass
local function Bypass()
    FindMethods()
    local methodsToDisable = { "GetIp", "AutoBan", "OnApplicationQuit", "SaveDevice", "SuspChambers", "Susp" }

    for _, methodName in ipairs(methodsToDisable) do
        if Results[methodName] then
            HackersHouse.disableMethod({
                { ['libName'] = "libil2cpp", ['offset'] = Results[methodName], ['libIndex'] = 'auto' }
            })
        end
    end

    gg.toast("ʙʏᴘᴀssﾠᴀᴛɪᴠᴀᴅᴏツ")
end

-- Executar o bypass diretamente
Bypass()
