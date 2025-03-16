function checkAndUploadVersion()
    local url = "https://fabicplay.x10.bz/versao.txt"

    -- Obtém a versão do jogo no GameGuardian
    local info = gg.getTargetInfo()
    local gameVersion = info.versionName

    -- Faz a requisição para obter a versão salva na nuvem
    local response = gg.makeRequest(url)

    if response and response.content then
        local serverVersion = response.content:match("%S+") -- Remove espaços extras

        if serverVersion ~= gameVersion then
            gg.alert("Versão desatualizada! Atualizando para " .. gameVersion)
            uploadVersion(gameVersion)
        else
            gg.alert("A versão já está atualizada: " .. serverVersion)
        end
    else
        gg.alert("Erro ao verificar a versão na nuvem.")
    end
end

function uploadVersion(version)
    local url = "https://fabicplay.x10.bz/upload.php"
    local response = gg.makeRequest(url .. "?version=" .. gg.utf8(version))

    if response and response.content then
        gg.alert("Upload concluído: " .. response.content)
    else
        gg.alert("Erro ao enviar a versão para a nuvem.")
    end
end

-- Chama a função para verificar e atualizar a versão
checkAndUploadVersion()
