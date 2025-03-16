function getOffsets()
    local url = "https://fabicplay.x10.bz/offsets.txt"
    local response = gg.makeRequest(url)

    if response and response.content then
        local offsets = {}
        for line in response.content:gmatch("[^\r\n]+") do
            local name, value = line:match("([^=]+)=(.+)")
            if name and value then
                offsets[name] = value
            end
        end
        return offsets
    else
        gg.alert("Erro ao obter offsets da nuvem.")
        return nil
    end
end

local offsets = getOffsets()
if offsets then
    for name, value in pairs(offsets) do
        print(name .. " -> " .. value)
    end
end
