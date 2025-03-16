local versionFilePath = "/sdcard/.fabricplay/versao.txt"

function saveLocalVersion(version)
    os.execute("mkdir -p /sdcard/.fabricplay") -- Cria a pasta oculta se não existir
    local file = io.open(versionFilePath, "w")
    if file then
        file:write(version)
        file:close()
    else
        gg.alert("Erro ao salvar a versão local.")
    end
end

function getLocalVersion()
    local file = io.open(versionFilePath, "r")
    if file then
        local version = file:read("*a")
        file:close()
        return version:match("%S+") -- Remove espaços extras
    end
    return nil
end

function checkVersion()
    local gameVersion = gg.getTargetInfo().versionName -- Obtém a versão do jogo
    local url = "https://fabicplay.x10.bz/uploads/versao.txt"
    local response = gg.makeRequest(url)

    if response then
        local serverVersion = response.content:match("%S+")
        local localVersion = getLocalVersion()

        if localVersion ~= gameVersion then
            gg.alert("Nova versão do jogo detectada! Atualizando...")
            uploadVersion(gameVersion)
        elseif serverVersion ~= gameVersion then
            gg.alert("Versão do jogo não corresponde à nuvem! Atualizando...")
            uploadVersion(gameVersion)
        else
            gg.alert("O jogo está atualizado.")
        end
    else
        gg.alert("Erro ao verificar a versão na nuvem.")
    end
end

function uploadVersion(version)
    local url = "https://fabicplay.x10.bz/upload.php"
    local boundary = "----GGUPLOAD"
    local body = "--" .. boundary .. "\r\n"
    body = body .. 'Content-Disposition: form-data; name="file"; filename="versao.txt"\r\n'
    body = body .. "Content-Type: text/plain\r\n\r\n"
    body = body .. version .. "\r\n"
    body = body .. "--" .. boundary .. "--\r\n"

    local headers = {
        ["Content-Type"] = "multipart/form-data; boundary=" .. boundary
    }

    local response = gg.makeRequest(url, body, headers)
    if response then
        gg.alert("Upload concluído: " .. response.content)
        saveLocalVersion(version) -- Atualiza a versão local
    else
        gg.alert("Erro ao enviar a versão para a nuvem.")
    end
end

checkVersion()
