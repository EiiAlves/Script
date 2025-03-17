function checkAndUploadVersion()
    local url = "https://fabicplay.x10.bz/versao.txt"

    -- Obtém as informações do jogo
    local info = gg.getTargetInfo()
    local gameVersion = info.versionName
    local packageName = info.packageName

    -- Faz a requisição para obter o conteúdo do arquivo version.txt
    local response = gg.makeRequest(url)

    if response and response.content then
        -- Extrai o nome do pacote e a versão do arquivo version.txt
        local serverPackageName, serverVersion = response.content:match("(%S+)%s+(%S+)")

        -- Verifica se o nome do pacote corresponde
        if serverPackageName ~= packageName then
            return
            gg.alert("Jogo Errado")
            gg.exit()
        end
            -- Verifica se a versão está desatualizada
            if serverVersion ~= gameVersion then
                -- Atualiza a versão no servidor
                uploadVersion(gameVersion)
            end
        end
end

function uploadVersion(version)
    local url = "https://fabicplay.x10.bz/upload.php"
    
    -- Envia a nova versão para o servidor
    local response = gg.makeRequest(url .. "?version=" .. version)
end

-- Chama a função para verificar e atualizar a versão
checkAndUploadVersion()
