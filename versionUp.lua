function checkAndUpdateOffsets()
    local versionUrl = "https://fabicplay.x10.bz/versao.txt"

    -- Obtém informações do jogo
    local info = gg.getTargetInfo()
    local gameVersion = info.versionName
    local packageName = info.packageName  -- Verifica o pacote do app

    -- Verifique se o pacote está correto antes de continuar
    if packageName ~= "com.ariel.zanyants" then
        gg.alert("Este script só pode ser executado no jogo correto!")
        gg.exit()
        return
    end

    -- Baixa a versão salva na nuvem
    local response = gg.makeRequest(versionUrl)

    if response and response.content then
        local serverVersion = response.content:match("%S+")

        if serverVersion ~= gameVersion then
            gg.alert("Atualizando offsets...")
            gg.toast("Isso pode demorar")
            io.open("UpdateOffset.lua","w+"):write(gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/UpdateOffset.lua").content):close()
require('UpdateOffset')
            uploadVersion(gameVersion) -- Chama a função com a versão correta
        end
    end
end

function uploadVersion(version)
    local url = "https://fabicplay.x10.bz/receive_offsets.php"
    
    -- Envia a nova versão para o servidor
    local response = gg.makeRequest(url .. "?version=" .. version)

    if response and response.content then
        gg.toast("Ok")
    else
        gg.alert("Erro ao enviar a versão para o servidor.")
    end
end

-- Executa a verificação e atualização das offsets
checkAndUpdateOffsets()
