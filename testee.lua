-- ======== Minimal Vector3 Field Finder (Simplified Core) ========

Get_user_input = {}
Get_second_field_offset = {}
Get_user_type = 8 -- Always Vector3
SearchTypeSelection = 1
val, Results = {}, {}
offst, error = 0, 0

-- -------------------------------------
-- Vector3 Handler
-- -------------------------------------
local function LoadVector3(addr, name)
    return {
        { address = addr,     flags = gg.TYPE_FLOAT, name = (name or "") .. " (X)" },
        { address = addr+0x4, flags = gg.TYPE_FLOAT, name = (name or "") .. " (Y)" },
        { address = addr+0x8, flags = gg.TYPE_FLOAT, name = (name or "") .. " (Z)" },
    }
end

-- -------------------------------------
-- Step 1 – initial search
-- -------------------------------------
function O_initial_search()
    gg.setVisible(false)
    user_input = ":" .. Get_user_input[1]
    offst = Get_user_input[3] and 25 or 0
end

-- -------------------------------------
-- Step 2 – deep initial search
-- -------------------------------------
function O_dinitial_search()
    gg.setRanges(error > 1 and gg.REGION_C_ALLOC or gg.REGION_OTHER)
    gg.searchNumber(user_input, gg.TYPE_BYTE)
    if gg.getResultsCount() == 0 then error=error+1 return end

    local r = gg.getResults(1)
    gg.refineNumber(r[1].value, gg.TYPE_BYTE)
    if gg.getResultsCount() == 0 then error=error+1 return end

    val = gg.getResults(gg.getResultsCount())
end

-- -------------------------------------
-- Step 3 – pointer search
-- -------------------------------------
function CA_pointer_search()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_OTHER | gg.REGION_ANONYMOUS)
    gg.loadResults(val)
    gg.searchPointer(offst)

    if gg.getResultsCount() == 0 then error=error+1 return end
    val = gg.getResults(gg.getResultsCount())
end

-- -------------------------------------
-- Step 4 – apply internal offset
-- -------------------------------------
function CA_apply_offset()
    local t = Get_user_input[4] and 0xfffffffffffffff8 or 0xfffffffffffffff0
    for i, v in ipairs(val) do v.address = v.address + t end
    val = gg.getValues(val)
end

-- -------------------------------------
-- Step 5 – base pointer
-- -------------------------------------
function A_base_value()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.loadResults(val)
    gg.searchPointer(offst)

    if gg.getResultsCount() == 0 then error=error+1 return end
    val = gg.getResults(gg.getResultsCount())
end

-- -------------------------------------
-- Step 6 – base accuracy
-- -------------------------------------
function A_base_accuracy()
    if offst ~= 0 then return end

    gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC)
    gg.loadResults(val)
    gg.searchPointer(offst)

    if gg.getResultsCount() == 0 then error=error+1 return end
    local r = gg.getResults(gg.getResultsCount())

    local out = {}
    for i, v in ipairs(r) do
        out[i] = { address = v.value, flags = gg.TYPE_QWORD }
    end

    val = gg.getValues(out)
end

-- -------------------------------------
-- Step 7 – final offset + Vector3 load
-- -------------------------------------
function A_user_given_offset()
    local offsetHex = tonumber(Get_user_input[2]) or 0
    local secondHex = tonumber(Get_second_field_offset[1]) or 0
    local out = {}

    for _, p in ipairs(val) do
        local base = p.address + offsetHex

        if SearchTypeSelection == 1 then
            -- CLASS → direct Vector3
            for _, v in ipairs(LoadVector3(base)) do table.insert(out, v) end

        elseif SearchTypeSelection == 2 then
            -- STRUCT → base + inner offset
            local structBase = base + secondHex
            for _, v in ipairs(LoadVector3(structBase)) do table.insert(out, v) end

        elseif SearchTypeSelection == 3 then
            -- CHILD → dereference + offset
            local pointer = gg.getValues({{address=base, flags=gg.TYPE_QWORD}})[1].value
            local childBase = pointer + secondHex
            for _, v in ipairs(LoadVector3(childBase)) do table.insert(out, v) end
        end
    end

-- manter apenas o primeiro Vector3 (3 valores)
if #out >= 3 then
    local filtered = { out[1], out[2], out[3] }
    out = filtered
end


    Results = gg.getValues(out)
    gg.loadResults(Results)
end

-- -------------------------------------
-- Pipeline executor
-- -------------------------------------
-- Variável global para armazenar os 3 endereços encontrados
SavedResults = nil


-- Variável global para armazenar os 3 endereços encontrados
SavedResults = nil


local function run_pipeline()
    -- Se já tiver salvo e for válido, retorna imediatamente
    if SavedResults 
        and SavedResults[1] 
        and SavedResults[1].address ~= 0 
    then
        return SavedResults
    end

    -- Executa o processo COMPLETO apenas se não tiver salvo
    error = 0
    O_initial_search();        if error>0 then return end
    O_dinitial_search();       if error>0 then return end
    CA_pointer_search();       if error>0 then return end
    CA_apply_offset();         if error>0 then return end
    A_base_value();            if error>0 then return end
    A_base_accuracy();         if error>0 then return end
    A_user_given_offset();     if error>0 then return end

    -- Garante que só serão usados os 3 primeiros valores
    if Results and #Results >= 3 then
        Results = { Results[1], Results[2], Results[3] }
    end

    -- Salva para uso futuro
    SavedResults = Results

    return Results
end
 


-- -------------------------------------
-- Public API (Class / Struct / Child)
-- -------------------------------------
function FindVector3_Class(className, offset, tryHard, bit32)
    Get_user_input = { className, offset or "0", tryHard, bit32 }
    SearchTypeSelection = 3
    Get_second_field_offset = {"0"}
    
    return run_pipeline()
end

function FindVector3_Struct(className, offset, tryHard, bit32, structOffset)
    Get_user_input = { className, offset or "0", tryHard, bit32 }
    SearchTypeSelection = 2
    Get_second_field_offset = { structOffset or "0" }
    return run_pipeline()
end

function FindVector3_ChildClass(className, offset, tryHard, bit32, childOffset)
    Get_user_input = { className, offset or "0", tryHard, bit32 }
    SearchTypeSelection = 3
    Get_second_field_offset = { childOffset or "0" }
    return run_pipeline()
end

-- ===== Example =====
--[[function Blip()
   local R = FindVector3_Class("NavigationGraph", "0x50")
   gg.getResults(gg.getResultsCount())
    gg.sleep(400)
gg.toast(R[1].value .. R[2].value)

return R
end

Blip()   ]]
