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
