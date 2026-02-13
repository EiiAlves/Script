--[[
    BYPASS ATUALIZADO E CORRIGIDO
]]

io.open("Il2cppApi.lua", "w+"):write(gg.makeRequest("https://raw.githubusercontent.com/kruvcraft21/GGIl2cpp/master/build/Il2cppApi.lua").content):close()
require('Il2cppApi')
Il2cpp({il2cppVersion = 27})

io.open("Method_Patching_Library_V1.lua", "w+"):write(gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/Method_Patching_Library_V1.lua").content):close()
require('Method_Patching_Library_V1')

io.open("APIMannel.lua","w+"):write(gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/APIMannel.lua").content):close()
require('APIMannel')

gg.setVisible(false)
gg.toast("ɪɴᴊᴇᴛᴀɴᴅᴏ...")

-- ==========================================
-- AUTO HH (DEFINIÇÃO GLOBAL PARA EVITAR ERRO)
-- ==========================================

AutoHH = {} -- Removido o 'local' para ser acessível em qualquer lugar
AutoHH.cache = {}

function findLibIndex()
    local libs = gg.getRangesList("libil2cpp.so")
    if not libs or #libs == 0 then return "auto" end
    for i, v in ipairs(libs) do
        if v.state == "Xa" or v.state == "x" then
            return i
        end
    end
    return "auto"
end

AutoHH.libIndex = findLibIndex()

function getOffset(className, methodName)
    local key = className .. "." .. methodName
    if AutoHH.cache[key] then
        return AutoHH.cache[key]
    end

    local res = Il2cpp.FindMethods({ methodName })
    if not res then return nil end

    for _, group in ipairs(res) do
        for _, m in ipairs(group) do
            if m.ClassName == className and m.MethodName == methodName then
                local off = tonumber(m.Offset, 16)
                AutoHH.cache[key] = off
                return off
            end
        end
    end
    return nil
end

function AutoHH.disable(className, methodName, mode)
    mode = mode or "disable"
    local offset = getOffset(className, methodName)
    if not offset then return false end

    local data = {
        libName = "libil2cpp.so",
        offset = offset,
        libIndex = AutoHH.libIndex
    }

    if mode == "disable" then
        local status = pcall(function() HackersHouse.disableMethod({data}) end)
        return status
    end

    return false
end

-- ==========================================
-- CONFIGURAÇÕES E STATUS
-- ==========================================

local statusFile = "/storage/emulated/0/DCIM/bypassStatus.txt"
bypassExecutado = false

local MethodMap = {
    { "GetIp", "LoadPuntos" },
    { "AutoBan", "SaveData" },
    { "OnApplicationQuit", "SaveData" },
    { "SaveDevice", "SaveData" },
    { "SuspChambers", "SaveData" },
    { "Susp", "SaveData" },
    { "SusShopZeroCost", "SaveData" },
    { "AntiSeasonChangebug", "SaveData" },
    { "RollBackSilk", "SaveData" },
    { "CheckEvtCrHack", "SaveData" },
    -- Métodos adicionais da dump:
    { "CheckID", "SaveData" },
    { "WriteIpList", "SaveData" },
    { "ResetProgress", "SaveData" }
}

function lerStatus()
    local file = io.open(statusFile, "r")
    if file then
        local status, timestamp = file:read("*l", "*l")
        file:close()
        local currentTime = os.time()
        local restartThreshold = 60 * 60
        if status == "true" and timestamp and (currentTime - tonumber(timestamp) < restartThreshold) then
            return true
        end
    end
    return false
end

function salvarStatus()
    local file = io.open(statusFile, "w")
    if file then
        local currentTime = os.time()
        file:write("true\n" .. currentTime)
        file:close()
    end
end

-- ==========================================
-- FUNÇÃO PRINCIPAL
-- ==========================================

function Bypass()
    if lerStatus() then
        gg.toast("⚠️ Bypass já aplicado recentemente.")
        return
    end

    gg.alert("⚠️ EXECUTAR NO MENU DO JOGO ⚠️")
    
    local falhas = {}
    local contador = 0

    for _, entry in ipairs(MethodMap) do
        local methodName = entry[1]
        local className = entry[2]

        -- Chamada corrigida (sem o _G que estava causando conflito com o local)
        local success = AutoHH.disable(className, methodName, "disable")

        if success then
            contador = contador + 1
        else
            table.insert(falhas, className .. "." .. methodName)
        end
    end

    if contador > 0 then
        bypassExecutado = true
        salvarStatus()
        if #falhas > 0 then
            gg.alert("⚠️ ʙʏᴘᴀssﾠᴀᴛɪᴠᴀᴅᴏツ com avisos!\n\nMétodos não encontrados:\n" .. table.concat(falhas, "\n"))
        else
            gg.toast("ʙʏᴘᴀssﾠᴀᴛɪᴠᴀᴅᴏツ")
        end
    else
        gg.alert("❌ FALHA CRÍTICA: Nenhum método desativado!")
    end
    
    gg.toast("ʙʏᴘᴀssﾠᴀᴛɪᴠᴀᴅᴏツ")
end

-- Execução
Bypass()