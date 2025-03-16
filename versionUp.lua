function checkAndUpdateOffsets()
    local versionUrl = "https://fabicplay.x10.bz/versao.txt"
    local updateUrl = "https://fabicplay.x10.bz/update_offsets.php"

    -- Obtém informações do jogo
    local info = gg.getTargetInfo()
    local gameVersion = info.versionName
    local packageName = info.packageName  -- Verifica o pacote do app

    -- Verifique se o pacote está correto antes de continuar
    if packageName ~= "com.exemplo.meujogo" then
        gg.alert("Este script só pode ser executado no jogo correto!")
        return
    end

    -- Baixa a versão salva na nuvem
    local response = gg.makeRequest(versionUrl)

    if response and response.content then
        local serverVersion = response.content:match("%S+")

        if serverVersion ~= gameVersion then
            gg.alert("Versão diferente! Atualizando offsets no servidor...")

            -- Chama o servidor para rodar o script de atualização
            local updateResponse = gg.makeRequest(updateUrl .. "?versao=" .. gameVersion)

            if updateResponse and updateResponse.content then
                gg.alert("Offsets atualizadas no servidor: " .. updateResponse.content)
            else
                gg.alert("Erro ao atualizar offsets no servidor.")
            end
        else
            gg.alert("Versão do jogo está correta. Nenhuma atualização necessária.")
        end
    else
        gg.alert("Erro ao verificar a versão na nuvem.")
    end
end

-- Executa a verificação e atualização das offsets
checkAndUpdateOffsets()

