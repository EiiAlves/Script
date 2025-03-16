function checkAndUploadVersion()
    local url = "https://fabicplay.x10.bz/versao.txt"

    local info = gg.getTargetInfo()
    local gameVersion = info.versionName
    local packageName = info.packageName

    local response = gg.makeRequest(url)

    if response and response.content then
        local serverPackageName, serverVersion = response.content:match("(%S+)%s+(%S+)")

        if serverPackageName == packageName then
            if serverVersion ~= gameVersion then
                gg.alert("Versão desatualizada! Atualizando...")
                updateRemoteVersion(gameVersion)
            else
                gg.alert("A versão já está atualizada.")
            end
        else
            gg.alert("Nome do pacote não corresponde.")
        end
    else
        gg.alert("Erro ao verificar a versão na nuvem.")
    end
end

function updateRemoteVersion(version)
    local url = "https://fabicplay.x10.bz/upload.php?versao=" .. version
    local response = gg.makeRequest(url)

    if response and response.content then
        gg.alert("Atualização enviada: " .. response.content)
    else
        gg.alert("Erro ao enviar atualização.")
    end
end

checkAndUploadVersion()
