io.open("Method_Patching_Library_V1.lua","w+"):write(gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/Method_Patching_Library_V1.lua").content):close()
require('Method_Patching_Library_V1')

io.open("APIMannel.lua","w+"):write(gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/APIMannel.lua").content):close()
require('APIMannel')
io.open("Il2cppApi.lua","w+"):write(gg.makeRequest("https://raw.githubusercontent.com/kruvcraft21/GGIl2cpp/master/build/Il2cppApi.lua").content):close()

require('Il2cppApi')

Il2cpp({il2cppVersion = 27})

--[[ 🔥 AutoHookVoid.lua
Sistema universal de hook automático, ultrarrápido e silencioso
Compatível com todas as classes/métodos Il2cpp
Autor: Biel (BeeMode System)
]]--

function AutoHookVoid(className, methodStart, methodUpdate, id)
    local cls = Il2cpp.FindClass(className)
    if not cls then
        gg.toast("Classe não encontrada: " .. className)
        return
    end

    -- 🔧 Compatibilidade com diferentes estruturas de retorno
    local classPtr = cls.Class or cls.Address or cls.class or cls[1]
    if not classPtr then
        gg.toast("Endereço de classe inválido para: " .. className)
        return
    end

    local mStart = Il2cpp.FindMethodInClass(classPtr, methodStart)
    local mUpdate = Il2cpp.FindMethodInClass(classPtr, methodUpdate)

    if not (mStart and mUpdate) then
        gg.toast("Métodos não encontrados em " .. className)
        return
    end

    local oStart = tonumber(mStart.Offset, 16)
    local oUpdate = tonumber(mUpdate.Offset, 16)
    if not (oStart and oUpdate) then return end

    -- Hook ultrarrápido
    hook_void(oUpdate, oStart, id)
    gg.sleep(30)
    endhook(oUpdate, id)
end
