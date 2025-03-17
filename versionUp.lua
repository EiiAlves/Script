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
            -- Verifica se a versão está desatualizada
            if serverVersion ~= gameVersion then
                
                uploadVersion(gameVersion)
            
            end
        else
            gg.alert("Nome do pacote não corresponde. Verificação cancelada.")

        end
    else
        gg.alert("Erro ao verificar a versão na nuvem.")
    end
end

function uploadVersion(version)
    local url = "https://fabicplay.x10.bz/upload.php"
    
    -- Envia a nova versão para o servidor
    local response = gg.makeRequest(url .. "?version=" .. version)

    if response and response.content then
        gg.alert("Upload concluído: " .. response.content)
    else
        gg.alert("Erro ao enviar a versão para a nuvem.")
    end
end

-- Chama a função para verificar e atualizar a versão
checkAndUploadVersion()
