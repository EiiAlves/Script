io.open("Il2cppApi.lua", "w+"):write(gg.makeRequest("https://raw.githubusercontent.com/kruvcraft21/GGIl2cpp/master/build/Il2cppApi.lua").content):close()
require('Il2cppApi')

Il2cpp({il2cppVersion = 27})
gg.setVisible(false)

io.open("Method_Patching_Library_V1.lua", "w+"):write(gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/Method_Patching_Library_V1.lua").content):close()
require('Method_Patching_Library_V1')
gg.toast("ɪɴᴊᴇᴛᴀɴᴅᴏ...")
gg.sleep(1000)

local MethodMap = {
    { "GetIp", "LoadPuntos" },
    { "AutoBan", "SaveData" },
    { "OnApplicationQuit", "SaveData" },
    { "SaveDevice", "SaveData" },
    { "SuspChambers", "SaveData" },
    { "Susp", "SaveData" }
}

local OffsetsEncontradas = false
local Results = {}
 bypassExecutado = false
local statusFile = "/storage/emulated/0/DCIM/bypassStatus.txt"

 function lerStatus()
    local file = io.open(statusFile, "r")
    if file then
        local status, timestamp = file:read("*l", "*l")
        file:close()
        local currentTime = os.time()
        local restartThreshold = 60 * 60
        if status == "true" and (currentTime - tonumber(timestamp) < restartThreshold) then
            bypassExecutado = true
        end
    end
end

function salvarStatus()
    local file = io.open(statusFile, "w")
    if file then
        local currentTime = os.time()
        file:write("true\n" .. currentTime)
        file:close()
    end
end

function FindMethods()
    if OffsetsEncontradas then return end

    local OffsetsParaDesativar = {}

    for _, methodInfo in ipairs(MethodMap) do
        local methodName = methodInfo[1]
        local className = methodInfo[2]

        local search = Il2cpp.FindMethods({ methodName })

        if search and #search > 0 then
            for _, method in ipairs(search[1]) do
                if method.ClassName == className then
                    local offset = "0x" .. method.Offset
                    table.insert(OffsetsParaDesativar, { method = methodName, offset = offset })
                end
            end
        end
    end

    if #OffsetsParaDesativar > 0 then
        for _, entry in ipairs(OffsetsParaDesativar) do
            HackersHouse.disableMethod({
                { ['libName'] = "libil2cpp", ['offset'] = entry.offset, ['libIndex'] = 'auto' }
            })
        end
        OffsetsEncontradas = true
    end
end

 function Bypass()
    if bypassExecutado then
        gg.toast("⚠️ Bypass já foi executado anteriormente.")
        return
    end
    gg.alert("⚠️ EXECUTAR NO MENU DO JOGO ⚠️")
    FindMethods()

    local methodsToDisable = { "GetIp", "AutoBan", "OnApplicationQuit", "SaveDevice", "SuspChambers", "Susp" }

    for _, methodName in ipairs(methodsToDisable) do
        if Results[methodName] then
            HackersHouse.disableMethod({
                { ['libName'] = "libil2cpp", ['offset'] = Results[methodName], ['libIndex'] = 'auto' }
            })
        end
    end

    bypassExecutado = true
    salvarStatus()
    gg.toast("ʙʏᴘᴀssﾠᴀᴛɪᴠᴀᴅᴏツ")
end

lerStatus()
Bypass()
