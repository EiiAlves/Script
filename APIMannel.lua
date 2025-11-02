local gg = gg;
local clock = os.clock;
local toast = gg.toast;
local info = gg.getTargetInfo();
local LibTable = {};

function isProcess64Bit()
    local regions = gg.getRangesList();
    local lastAddress = regions[#regions]["end"];
    return (lastAddress >> 32) ~= 0;
end

local ISA = isProcess64Bit();

function ISAOffsets()
    if (ISA == false) then
        edi = "+0x";
        ed = "-0x";
    elseif (ISA == true) then
        edi = "0x";
        ed = "-0x";
    end
end
ISAOffsets();

function ISAOffsetss()
    if (ISA == false) then
        edit = "~A B " .. edits;
    elseif (ISA == true) then
        edit = "~A8 B [PC,#" .. edits .. "]";
    end
end

xg = {}

function gets(g)
    gg.loadResults(end_hook)
    xg[g] = gg.getResults(gg.getResultsCount())
    gg.clearResults()
end

function libs(loz)
    local libx = gg.getRangesList(loz)
    lib = nil -- Resetar lib antes de procurar

    for i, v in ipairs(libx) do
        if v.state == "Xa" then -- Somente código executável
            lib = v.start -- Pega o endereço inicial da biblioteca
            break
        end
    end

    if lib == nil then
        gg.alert("Erro: Biblioteca '" .. loz .. "' não encontrada! Certifique-se de que o jogo está rodando e que Il2cpp.so foi carregado.")
     end
end

function __()
    xHEX = string.format("%X", aaaa);
    if (#xHEX > 8) then
        act = (#xHEX - 8) + 1;
        xHEX = string.sub(xHEX, act);
    end
    edits = edi .. xHEX;
    ISAOffsetss();
end

function _()
    aaa = b - a;
    xHEX = string.format("%X", aaa);
    if (#xHEX > 8) then
        act = (#xHEX - 8) + 1;
        xHEX = string.sub(xHEX, act);
    end
    edits = ed .. xHEX;
    ISAOffsetss();
end

function endhook(cc, g)
    if lib == nil then
        gg.alert("Erro: Biblioteca Il2cpp.so não foi inicializada. Certifique-se de que chamou libs('Il2cpp.so') antes.")
        return
    end

    LibStart = lib
    local eh = {}
    eh[1] = {address = (LibStart + cc), flags = gg.TYPE_DWORD, value = xg[g][1].value, freeze = true}
    gg.addListItems(eh)
    gg.clearList()
end

function hook_void(cc, bb, g)
    if lib == nil then
        gg.alert("Erro: Biblioteca Il2cpp.so não foi inicializada. Certifique-se de que chamou libs('Il2cpp.so') antes.")
        return
    end

    LibStart = lib;
    local m = {};
    m[1] = {address = (LibStart + bb), flags = gg.TYPE_DWORD};
    gg.addListItems(m);
    a = m[1].address;
    gg.clearList();

    local p = {};
    p[1] = {address = (LibStart + cc), flags = gg.TYPE_DWORD};
    gg.addListItems(p);
    gg.loadResults(p);
    end_hook = gg.getResults(1);
    gets(g)

    local n = {};
    n[1] = {address = (LibStart + cc), flags = gg.TYPE_DWORD};
    gg.addListItems(n);
    b = n[1].address;
    gg.clearResults();
    gg.clearList();

    aaaa = a - b;
    if (tonumber(aaaa) < 0) then
        _();
    end
    if (tonumber(aaaa) > 0) then
        __();
    end

    local n = {};
    n[1] = {address = (LibStart + cc), flags = gg.TYPE_DWORD, value = edit, freeze = true};
    gg.addListItems(n);
    gg.clearList();
end



-- Carregar a biblioteca Il2cpp.so
libs("libil2cpp.so")

if lib == nil then
    gg.alert("Erro crítico: A biblioteca Il2cpp.so não foi carregada. O script não pode continuar.")
    return
end

-- 🔧===========================================================
-- 🔧 Função para desativar hooks criados com hook_void()
-- 🔧 Inspirado no Method_Patching_Library da HackerHouse
-- 🔧===========================================================

-- 🧩 Desativa um hook específico pelo ID
function DisableHook(id)
    if not xg or not xg[id] or not xg[id][1] then
        gg.toast("⚠️ Nenhum hook ativo com ID: " .. tostring(id))
        return false
    end
    if not lib then libs("libil2cpp.so") end

    local original = xg[id][1].value
    local addr = lib + xg[id][1].address - lib  -- recupera offset salvo

    -- restaura valor original e remove freeze
    gg.setValues({{ address = addr, flags = gg.TYPE_DWORD, value = original, freeze = false }})

    -- limpa da memória
    xg[id] = nil
    gg.toast("✅ Hook ID " .. tostring(id) .. " desativado")
    return true
end

-- 🧩 Desativa todos os hooks ativos de uma vez
function DisableAllHooks()
    if not xg or next(xg) == nil then
        gg.toast("ℹ️ Nenhum hook ativo encontrado")
        return false
    end
    if not lib then libs("libil2cpp.so") end

    local total = 0
    for id, data in pairs(xg) do
        if data[1] then
            local addr = data[1].address
            local value = data[1].value
            gg.setValues({{ address = addr, flags = gg.TYPE_DWORD, value = value, freeze = false }})
            total = total + 1
        end
    end
    xg = {}
    gg.toast("🧹 Todos os " .. total .. " hooks foram desativados")
    return true
end
