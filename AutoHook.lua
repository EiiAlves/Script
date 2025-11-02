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

function disable_hook(Table)
    if validateDisableParams(Table) then return end

    local ToEdit = {}
    for i, v in ipairs(Table) do
        local libName = v.libName or "libil2cpp.so"
        local LibRanges = gg.getRangesList(libName)
        if not LibRanges or #LibRanges == 0 then return end

        local libIndex = (v.libIndex == nil or v.libIndex == "auto") and getLibIndex(LibRanges) or v.libIndex
        local baseAddr = LibRanges[libIndex].start
        local addr = baseAddr + v.offset
        local size = tonumber(v.size) or 1
        if size < 1 then size = 1 end

        -- salva valores originais
        local defaultList = {}
        for j = 0, size - 1 do
            table.insert(defaultList, { address = addr + (j * 4), flags = gg.TYPE_DWORD })
        end
        HackersHouse.disableMethodList.activatedCheats[libName .. tostring(v.offset)] = {
            defaultValues = gg.getValues(defaultList)
        }

        -- aplica patch
        ToEdit[i] = {
            address = addr,
            flags = gg.TYPE_DWORD,
            value = HackersHouse.is64Bit and "~A8 RET" or "~A BX LR"
        }
    end

    gg.setValues(ToEdit)
end

-- 🧩 Restaura método(s) manualmente
function disable_hookOff(Table)
    if validateDisableParams(Table) then return end

    local ToRestore = {}
    local idx = 1
    for i, v in ipairs(Table) do
        local libName = v.libName or "libil2cpp.so"
        local key = libName .. tostring(v.offset)
        local saved = HackersHouse.disableMethodList.activatedCheats[key]

        if saved and saved.defaultValues then
            for _, entry in ipairs(saved.defaultValues) do
                ToRestore[idx] = {
                    address = entry.address,
                    flags = entry.flags,
                    value = entry.value,
                    freeze = false
                }
                idx = idx + 1
            end
            HackersHouse.disableMethodList.activatedCheats[key] = nil
        end
    end

    if #ToRestore > 0 then gg.setValues(ToRestore) end
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
