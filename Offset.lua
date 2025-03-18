local url = "https://fabicplay.x10.bz/get_offsets.php"
local response = gg.makeRequest(url)

if not response or response.content == "" then
    os.exit() -- Sai do script se não conseguir carregar as offsets
end

-- Converte o conteúdo do arquivo em variáveis globais
for line in response.content:gmatch("[^\r\n]+") do
    local key, value = line:match("([^=]+)%s*=%s*(0x%x+)")
    if key and value then
        _G[key] = value -- Cria variáveis globais com os nomes das offsets
    end
end

-- Agora as offsets podem ser usadas diretamente no script
-- Exemplo de uso:
-- gg.setValues({{address = StartBee, flags = gg.TYPE_QWORD, value = "0x123456"}})
