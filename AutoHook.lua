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
