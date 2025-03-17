function checkAndUpdateOffsets()
    local versionUrl = "https://fabicplay.x10.bz/versao.txt"
    

    -- Obtém informações do jogo
    local info = gg.getTargetInfo()
    local gameVersion = info.versionName
    local packageName = info.packageName  -- Verifica o pacote do app

    -- Verifique se o pacote está correto antes de continuar
    if packageName ~= "com.ariel.zanyants" then
        gg.alert("Este script só pode ser executado no jogo correto!")
        return
        gg.exit()
    end

    -- Baixa a versão salva na nuvem
    local response = gg.makeRequest(versionUrl)

    if response and response.content then
        local serverVersion = response.content:match("%S+")

        if serverVersion ~= gameVersion then
            gg.alert("Jogo desatualizado")
            
         end
    else
        gg.alert("Erro ao verificar a versão na nuvem.")
    end
end

-- Executa a verificação e atualização das offsets
checkAndUpdateOffsets()
