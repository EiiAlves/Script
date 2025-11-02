io.open("Method_Patching_Library_V1.lua","w+"):write(gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/Method_Patching_Library_V1.lua").content):close()
require('Method_Patching_Library_V1')

io.open("APIMannel.lua","w+"):write(gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/APIMannel.lua").content):close()
require('APIMannel')
io.open("Il2cppApi.lua","w+"):write(gg.makeRequest("https://raw.githubusercontent.com/kruvcraft21/GGIl2cpp/master/build/Il2cppApi.lua").content):close()

require('Il2cppApi')

Il2cpp({il2cppVersion = 27})

gg.setVisible(true)
function AutoHookVoid(className, methodStart, methodUpdate, id)
local function FindMethodFiltered(methodName)
        local results = Il2cpp.FindMethods({methodName})
        if not results or #results == 0 then return nil end
        for _, group in ipairs(results) do
            for _, v in ipairs(group) do
                if v.ClassName == className then
                    return tonumber(v.Offset, 16)
                end
            end
        end
        return nil
    end

    local o1 = FindMethodFiltered(methodStart)
    local o2 = FindMethodFiltered(methodUpdate)
    if not (o1 and o2) then return end

    hook_void(o2, o1, id)
    gg.sleep(30)
    endhook(o2, id)
end 
HackersHouse = HackersHouse or {}
HackersHouse.is64Bit = gg.getTargetInfo().x64
HackersHouse.disableMethodList = HackersHouse.disableMethodList or { activatedCheats = {} }

-- 🔹 validação mínima
local function validateDisableParams(Table)
    if type(Table) ~= "table" then return true end
    for i, v in ipairs(Table) do
        if not v.offset then return true end
    end
    return false
end

local function getLibIndex(LIB)
    for idx, v in ipairs(LIB) do
        if v.state == "Xa" then return idx end
    end
    return 1
end
-- 🔹 Armazena métodos desativados automaticamente
HookCache = HookCache or {}

-- 🧩 Desativa método automaticamente (busca + patch)
function AutoHookDisable(className, methodName, size)
    local function FindMethodFiltered(methodName)
        local results = Il2cpp.FindMethods({ methodName })
        if not results or #results == 0 then return nil end
        for _, group in ipairs(results) do
            for _, v in ipairs(group) do
                if v.ClassName == className then
                    return tonumber(v.Offset, 16)
                end
            end
        end
        return nil
    end

    local o1 = FindMethodFiltered(methodName)
    if not o1 then return end

    HookCache[methodName] = o1
    disable_hook({ { offset = o1, size = size } })
end

-- 🧩 Restaura um método pelo nome (usando cache automático)
function DisableAuto(methodName)
    local offset = HookCache[methodName]
    if not offset then return end
    disable_hookOff({ { offset = offset } })
end

-- 🧩 Restaura todos os métodos desativados automaticamente
function DisableAllAuto()
    local restoreList = {}
    for name, offset in pairs(HookCache) do
        table.insert(restoreList, { offset = offset })
    end
    if #restoreList > 0 then
        disable_hookOff(restoreList)
        HookCache = {} -- limpa cache após restaurar tudo
    end
end
