-- Token de autenticação GitHub (NUNCA compartilhe publicamente)
local token = "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"

-- Função para carregar scripts privados diretamente do seu repositório
function carregarScriptPrivado(nomeDoArquivo)
    local headers = {
        ["Authorization"] = "token " .. token,
        ["Accept"] = "application/vnd.github.v3.raw"
    }
    local url = "https://api.github.com/repos/EiiAlves/Script/contents/" .. nomeDoArquivo
    local response = gg.makeRequest(url, headers)

    if response and response.content and #response.content > 0 then
        local ok, erro = pcall(load(response.content))
        if not ok then
            gg.alert("❌ Erro ao executar " .. nomeDoArquivo .. ":\n" .. tostring(erro))
        end
    else
        gg.alert("❌ Erro ao baixar " .. nomeDoArquivo .. ".\nVerifique se o repositório está acessível ou se o nome está correto.")
    end
end

-- Carregar seus arquivos auxiliares do GitHub privado
carregarScriptPrivado("Method_Patching_Library_V1.lua")
carregarScriptPrivado("APIMannel.lua")
carregarScriptPrivado("login.lua")

-- Agora continue o seu código normalmente aqui, o restante do seu main.lua
-- Por exemplo:
-- iniciarMenuPrincipal()


--[[pcall(load(gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/Method_Patching_Library_V1.lua").content))
pcall(load(gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/APIMannel.lua").content))
pcall(load(gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/login.lua").content))
]]
gg.setVisible(true)

local Soldado = "❌"
local Worker = "❌"
local Player = "❌"

local Seeds = "❌"
local Resines = "❌"
local Leafs = "❌"
local Insect = "❌"

local Golden ="❌"

local Mel = "❌"

local Bee = "❌"

local Nozes = "❌"

local Pvp = "❌"

local Trof ="❌"
function SoldadoToast()
if Soldado =="❌" then gg.toast('❌') else gg.toast('✅')
end
end

function WorkerToast()
if Worker =="❌" then gg.toast("❌") else gg.toast("✅")
end
end

function PlayerToast()
if Player =="❌" then gg.toast("❌") else gg.toast("✅")
end
end


---- Função do menu

function START()
    if not usuario or not dados.expira_em then
        gg.alert("❌ ERRO: Usuário não logado ou dados inválidos.")
        os.exit()
    end
if not bypassExecutado then
        API = gg.makeRequest('https://raw.githubusercontent.com/EiiAlves/Script/main/ByPass.lua').content
pcall(load(API))
end
pcall(load(gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/versionUp.lua").content))



    -- Menu com opção de LogOut
    Menu = gg.choice({
        "👤 ᴜꜱᴜᴀʀɪᴏ: " .. usuario .. " | ⏳ ᴇxᴘɪʀᴀ: " .. dados.expira_em,
        "──────────────────────────────",
        "⚠️ [1] Forçar ByPass",
        "🐜 [2] Formigas",
        "🍃 [3] Recursos",
        "🕑 [4] Speed Game",
        "🪳 [5] Spawn Inseto",
        "💯 [6] Fusão",
        "💀 [7] All Item",
        "🍯 [8] Melzinho",
        "🧪 [9] Metamorfose",
        "🐝 [10] Colmeia",
        "♦️ [11] Recompensas Temporada",
        "⚔️ [12] AutoWin",
        "💀 [13] Upgrade Colônia",
        "🏆 [14] Farm Troféu",
        "🎭 [15] Skin",
        "🚪 LogOut" -- Opção para fazer logout
    }, nil, "🎮 Bem-vindo " .. usuario .. "!")

    if Menu == nil then
        gg.setVisible(false)
        return
    end

    -- Ajuste das opções para deslocar em 2 números
    if Menu == 3 then
        -- Opção 3 (Forçar ByPass)
        menu = gg.alert("⚠️Use se o jogo resetou⚠️", "Continuar", "Voltar")
        if menu == 1 then
            BYPASS()
        else
            START()
        end
    elseif Menu == 4 then
        -- Opção 4 (Formigas)
        menu = gg.multiChoice({Soldado.."\b\bSoldado Imortal", Worker.."\b\bWorker Imortal", Player.."\b\bPlayer Imortal", Bee.."\b\bAbelha"})
        if menu == nil then START() return end

        if menu[1] then SoldadoImortal() end
        if menu[2] then WorkerImortal() end
        if menu[3] then PlayerImortal() end
        if menu[4] then BeeMode() end
    elseif Menu == 5 then
        -- Opção 5 (Recursos)
        menu = gg.multiChoice({Leafs.."Folha Infinita", Resines.."Resina Infinita", Seeds.."Semente Infinita", Insect.."Inseto Infinito"})
        if menu == nil then START() return end

        if menu[3] then Sementes() end
        if menu[1] then Folhas() end
        if menu[2] then Resinas() end
        if menu[4] then Insetos() end
    elseif Menu == 6 then
        -- Opção 6 (Speed Game)
        SpeedTimer()
    elseif Menu == 7 then
        -- Opção 7 (Spawn Inseto)
        while true do
            menu = gg.multiChoice({
                "Criaturas Especiais➡️",
                Nozes.."\b\bCriatura Evento 🌀",
                "Spawn Besouro-Tigre 🐾",
                "Spawn Besouro-Rinoceronte 🪲",
                "Spawn Bombardeiro 💨",
                "Spawn Vespa Asiática 🐝",
                "Spawn Borboleta 🦋",
                "Spawn Mariposa 🪰",
                "Spawn Centopéia 🐛",
                "Spawn Escorpião 🦂",
                "Gold 🪙",
                "Spawn Aranha 🕷️",
                "Spawn Louva Deus 🦗",
                "InstantCapture"
            }) -- 13 opções

            if menu == nil then break end

            if menu[12] then SpawnSpider() end
            if menu[13] then SpawnMantis() end
            if menu[3] then SpawnTBeetle() end
            if menu[4] then SpawnRBeetle() end
            if menu[5] then SpawnBombardier() end
            if menu[6] then SpawnHornet() end
            if menu[7] then SpawnCButter() end
            if menu[8] then SpawnDragon() end
            if menu[9] then SpawnCent() end
            if menu[10] then SpawnScorpion() end
            if menu[11] then SpawnRandomInsect() end
            if menu[2] then CreatureEvent() end
            if menu[14] then InstaCapture() end

            -- Acesso ao menu de novas criaturas
            if menu[1] then
                while true do
                    new_menu = gg.multiChoice({
                        "Spawn Ghost 👻",
                        "Spawn Orchid 🌸",
                        "Spawn Flowerm 🌼",
                        "Spawn Jewel 💎",
                        "Spawn Pennant 🎏",
                        "Spawn Skimmer 🏞️",
                        "Spawn Emerald 💚",
                        "Spawn Antler 🦌",
                        "Spawn Firefly 🔥",
                        "Spawn Skull 💀",
                        "Spawn XBeetle ❌🐞",
                        "Spawn Chaufer 🚗🐞",
                        "Spawn Hisser 🐞🔊",
                        "Spawn Pink 🌸🐞",
                        "Spawn Trilo 🦖",
                        "Spawn Cyanide ☠️",
                        "Spawn Flang ⚡",
                        "Spawn Lugu 🎇",
                        "Spawn Festive 🎉",
                        "Spawn Manticore 🦁",
                        "Spawn Emp ⚡",
                        "Spawn Junc 🌾",
                        "Spawn Butter 🦋",
                        "Spawn Xmoth 🌙🦋",
                        "Spawn Decmoth 🍂🦋",
                        "Spawn RedPaper 🐝♦️",
                        "⬅️ Voltar"
                    }) -- 26 opções

                    if new_menu == nil then break end

                    if new_menu[1] then SpawnFantasma() end
                    if new_menu[2] then SpawnOrquidea() end
                    if new_menu[3] then SpawnFlorM() end
                    if new_menu[4] then Spawnjoia() end
                    if new_menu[5] then SpawnEstandarte() end
                    if new_menu[6] then SpawnLibelulaAzul() end
                    if new_menu[7] then SpawnEsmeralda() end
                    if new_menu[8] then SpawnGalhada() end
                    if new_menu[9] then SpawnVagalume() end
                    if new_menu[10] then SpawnCaveira() end
                    if new_menu[11] then SpawnBesouroX() end
                    if new_menu[12] then SpawnFlowerChaufer() end
                    if new_menu[13] then SpawnSibilante() end
                    if new_menu[14] then SpawnRosa() end
                    if new_menu[15] then SpawnTrilobita() end
                    if new_menu[16] then SpawnCianeto() end
                    if new_menu[17] then SpawnFFlang() end
                    if new_menu[18] then SpawnLLugu() end
                    if new_menu[19] then SpawnFestivo() end
                    if new_menu[20] then SpawnManticora() end
                    if new_menu[21] then SpawnEEmp() end
                    if new_menu[22] then SpawnJJunc() end
                    if new_menu[23] then SpawnBButter() end
                    if new_menu[24] then SpawnMariposaX() end
                    if new_menu[25] then SpawnMariposadecaida() end
                    if new_menu[26] then SpawnVespaVermelha() end

                    -- Opção para voltar ao menu principal
                    if new_menu[27] then break end
                end
            end
        end
    elseif Menu == 8 then
        -- Opção 8 (Fusão)
        Fusao()
    elseif Menu == 9 then
        -- Opção 9 (All Item)
        while true do
            menu = gg.multiChoice({"Diamante", "Fungo", "Folha", "Semente", "Inseto", "Resina", "Agua", "Melada", "Token", "Ficha Flores",
            "Ficha Semente", "Flor", "Pulgão"}, nil, "escolha uma opção")
            if menu == nil then break end

            if menu[1] then Gema() end
            if menu[2] then Fungo() end
            if menu[3] then Folha() end
            if menu[4] then Semente() end
            if menu[5] then Inseto() end
            if menu[6] then Resina() end
            if menu[7] then Agua() end
            if menu[8] then Melada() end
            if menu[9] then Token() end
            if menu[10] then FichaF() end
            if menu[11] then FichaS() end
            if menu[12] then Flor() end
            if menu[13] then Pulgao() end
        end
    elseif Menu == 10 then
        -- Opção 10 (Melzinho)
        melzinho()
    elseif Menu == 11 then
        -- Opção 11 (Gold)
        Gold()
    elseif Menu == 12 then
        -- Opção 12 (Colmeia)
        Colmeia()
    elseif Menu == 13 then
        -- Opção 13 (Recompensas Temporada)
        Season()
    elseif Menu == 14 then
        -- Opção 14 (AutoWin)
        AutoWin()
    elseif Menu == 15 then
        -- Opção 15 (Upgrade Colônia)
        while true do
            menu = gg.choice({
                "CamaraFolha ☘️",
                "CamaraFungo 🍄",
                "CamaraSemente 🌰",
                "CamaraRainha 👑",
                "CamaraEncubadora 🥚",
                "CamaraEscravidao 💁🏿‍♂️",
                "CamaraInseto 🦵🏿",
                "CamaraMel 🍯",
                "CamaraResina 💷",
                "CamaraAgua 💦"
            }, nil, "Escolha uma opção")

            if menu == nil then break end  -- Sai do loop se o usuário cancelar

            if menu == 1 then CamaraFolha() end
            if menu == 2 then CamaraFungo() end
            if menu == 3 then CamaraSemente() end
            if menu == 4 then CamaraRainha() end
            if menu == 5 then CamaraOvo() end
            if menu == 6 then CamaraEscravidao() end
            if menu == 7 then CamaraInseto() end
            if menu == 8 then CamaraMel() end
            if menu == 9 then CamaraResina() end
            if menu == 10 then CamaraAgua() end
        end
    elseif Menu == 16 then
        -- Opção 16 (Farm Troféu)
        FarmTrof()
    elseif Menu == 17 then
        -- Opção 17 (Skin)
        AllSkin()
    elseif Menu == 18 then
        -- Opção 18 (LogOut)
        fazerLogout()
    end




end

function SpeedTimer()
    gg.setRanges(gg.REGION_C_DATA)
    gg.clearResults()
    gg.clearList()
    gg.searchNumber("-3.1514847e24", 16)
    gg.refineNumber("-3.1514847e24", 16)

    local r = gg.getResults(gg.getResultsCount())
    gg.clearResults()
    gg.clearList()
    gg.sleep(400)

    local R = gg.prompt({"🕖SELECIONE A VELOCIDADE🕖\n➖➖➖➖➖➖➖➖➖➖ [1041313291; 1047313291]"},
    { [1] = defaultValue },
    { [1] = "number" })

    if R == nil then 
        gg.toast("Cancelled") 
        return 
    end

    for i, v in ipairs(r) do
        v.address = v.address + 0x4 -- Alterar para a direção correta
        v.flags = 4
    end

    gg.loadResults(r)
    gg.getResults(gg.getResultsCount())
    gg.editAll(R[1], 4)
    gg.toast("Alteração concluída com sucesso!")
    gg.clearResults()
    gg.clearList()
end


--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖


function melzinho()
 if Mel == "❌" then
hook_void(UpdateMovePlayer, TpOutHill,1)   
gg.sleep(50)
endhook(UpdateMovePlayer ,1)

hook_void(UpdateMovePlayer, TpDungeon,1)                
gg.sleep(50)
endhook(UpdateMovePlayer ,1)                

hook_void(CancelDung, HoneyReward,1)


       --[[ callAnotherMethodLite({
      libName = "libil2cpp",
        targetOffset = CancelDung, 
        destinationOffset = HoneyReward, 
        parameters ={}, 
        repeate = 1
      }
    )]]
    Mel="✅"
    else
    --[[HackersHouse.callAnotherMethodOff({
      { ['libName'] = "libil2cpp",
        ['targetOffset'] = CancelDung, 
        }})]]
        endhook(CancelDung,1)
          Mel="❌"
    end
end

function SoldadoImortal()
    if Soldado == "❌" then Soldado = "✅"
HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = AntSoldado, 
        ['libIndex'] = 'auto'
      }
    })
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = Bombardier,
        ['libIndex'] = 'auto'
      }
    })
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = AntSoldierPvP,--Die - PVPSoldier
        ['libIndex'] = 'auto'
      }
    })
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = BombardierPVP,--FindBlackAnts - PVPBombardierEnemy
        ['libIndex'] = 'auto'
      }
    })
    
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = PvpCannon,--FindBlackAnts - PVPBombardierEnemy
        ['libIndex'] = 'auto'
      }
    })
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = CentAbility,--FindBlackAnts - PVPBombardierEnemy
        ['libIndex'] = 'auto'
      }
    })
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = RBeetleAbility,
        ['libIndex'] = 'auto'
      }
    })
 SoldadoToast()
 
 
    elseif Soldado == "✅" then
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = Bombardier,
      }
    })
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = AntSoldado,
      }
    })
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = AntSoldierPvP,--Die - PVPSoldier
      }
    })
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = BombardierPVP,--FindBlackAnts - PVPBombardierEnemy
      }
    })
    
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = PvpCannon,--FindBlackAnts - PVPBombardierEnemy
      }
    })
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = CentAbility,--FindBlackAnts - PVPBombardierEnemy
      }
    })
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = RBeetleAbility,
      }
    })
     Soldado = "❌"
 SoldadoToast()
end
end

function WorkerImortal()
    if Worker == "❌" then Worker = "✅"
    
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = AntWorker, 
        ['libIndex'] = 'auto'
      }
    })
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = Bombardier,
        ['libIndex'] = 'auto'
      }
    })
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = CentAbility,--FindBlackAnts - PVPBombardierEnemy
        ['libIndex'] = 'auto'
      }
    })
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = RBeetleAbility,
        ['libIndex'] = 'auto'
      }
    })
 WorkerToast()
    elseif Worker == "✅" then
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = AntWorker,
      }
    })
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = Bombardier,
      }
    })
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = CentAbility,--FindBlackAnts - PVPBombardierEnemy
      }
    })
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = RBeetleAbility,
      }
    })
     Worker = "❌"
 WorkerToast()
end
end

function PlayerImortal()
    if Player == "❌" then Player = "✅"
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = AntPlayer,
        ['libIndex'] = 'auto'
      }
    })
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = Bombardier,
        ['libIndex'] = 'auto'
      }
    })
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = AntPlayerDung,
        ['libIndex'] = 'auto'
      }
    })
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = AntPlayerCoop,
        ['libIndex'] = 'auto'
      }
    })
        HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = BombardierPVP,--FindBlackAnts - PVPBombardierEnemy
        ['libIndex'] = 'auto'
      }
    })
    
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = PvpCannon,--FindBlackAnts - PVPBombardierEnemy
        ['libIndex'] = 'auto'
      }
    })
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = AntPlayerPvp,
        ['libIndex'] = 'auto'
      }
    })
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = CentAbility,--FindBlackAnts - PVPBombardierEnemy
        ['libIndex'] = 'auto'
      }
    })
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = RBeetleAbility,
        ['libIndex'] = 'auto'
      }
    })
 PlayerToast()
    elseif Player == "✅" then
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = AntPlayer,
      }
    })
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = Bombardier,
      }
    })
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = AntPlayerDung,
      }
      })
      HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = AntPlayerCoop,
      }
    })
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = BombardierPVP,--FindBlackAnts - PVPBombardierEnemy
      }
    })
    
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = PvpCannon,--FindBlackAnts - PVPBombardierEnemy
      }
    })
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = AntPlayerPvp,
      }
    })
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = CentAbility,--FindBlackAnts - PVPBombardierEnemy
      }
    })
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = RBeetleAbility,
      }
    })
     Player = "❌"
 PlayerToast()
end
end

function Folhas()
    if Leafs == "❌" then Leafs = "✅"
    --[[ Desativar a função no offset 0x4FCAB4
disable_void(Leaves, "desativa_folha")

--]]
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = Leaves,
        ['libIndex'] = 'auto'
      }
    })
 gg.toast("Changed ✅")
    elseif Leafs == "✅" then
    
--[[ Restaurar a função mais tarde
endhook(Leaves, "desativa_folha")
]]
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = Leaves,
      }
    })
     Leafs = "❌"
 gg.toast("Changed ❌")
end
end

function Sementes()
    if Seeds == "❌" then Seeds = "✅"
    
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = Seed, 
        ['libIndex'] = 'auto'
      }
    })
 gg.toast("Changed ✅")
    elseif Seed == "✅" then
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = Seed,
      }
    })
     Seeds = "❌"
 gg.toast("Changed ❌")
end
end

function Resinas()
    if Resines == "❌" then Resines = "✅"
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = Resine,
        ['libIndex'] = 'auto'
      }
    })
 gg.toast("Changed ✅")
    elseif Resine == "✅" then
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = Resine,
      }
    })
     Resines = "❌"
 gg.toast("Changed ❌")
end
end

function Insetos()
    if Insect == "❌" then Insect = "✅"
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = PartInse,
        ['libIndex'] = 'auto'
      }
    })
 gg.toast("Changed ✅")
    elseif Resine == "✅" then
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = PartInse,
      }
    })
     Insect = "❌"
 gg.toast("Changed ❌")
end
end

--PopulateMap
function SpawnSpider()
hook_void(UpdatePopulateMap, SpawnAranha,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
 gg.toast("Spawned ✅")
end

function SpawnMantis()
hook_void(UpdatePopulateMap, SpawnLouvaDeus,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1)
gg.toast("Spawned ✅")
end

function SpawnTBeetle()
hook_void(UpdatePopulateMap, SpawnBesouroTigre,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1)
gg.toast("Spawned ✅")
end

function SpawnBombardier()
hook_void(UpdatePopulateMap, SpawnBombardeiro,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1)
gg.toast("Spawned ✅")
end

function SpawnScorpion()
hook_void(UpdatePopulateMap, SpawnEscorpiao,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1)
gg.toast("Spawned ✅")
end

function SpawnRBeetle()
hook_void(UpdatePopulateMap, SpawnBesouroRhino,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1)
gg.toast("Spawned ✅")
end

function SpawnCButter()
hook_void(UpdatePopulateMap, SpawnBorboletaAzul,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1)
gg.toast("Spawned ✅")
end

function SpawnCent()
hook_void(UpdatePopulateMap, SpawnCentopeia,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1)
gg.toast("Spawned ✅")
end

function SpawnHornet()
hook_void(UpdatePopulateMap, SpawnVespaAsiatica,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1)
gg.toast("Spawned ✅")
end

function SpawnDragon()
hook_void(UpdatePopulateMap, SpawnLibelula,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1)
gg.toast("Spawned ✅")
end

function SpawnFantasma()
hook_void(UpdatePopulateMap, SpawnGhost,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnOrquidea()
hook_void(UpdatePopulateMap, SpawnOrchid,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnFlorM()
hook_void(UpdatePopulateMap, SpawnFlowerm,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function Spawn()
hook_void(UpdatePopulateMap, SpawnJewel,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnEstandarte()
hook_void(UpdatePopulateMap, SpawnPennant,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnLibelulaAzul()
hook_void(UpdatePopulateMap, SpawnSkimmer,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnEsmeralda()
hook_void(UpdatePopulateMap, SpawnEmerald,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnGalhada()
hook_void(UpdatePopulateMap, SpawnAntler,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnVagalume()
hook_void(UpdatePopulateMap, SpawnFirefly,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnCaveira()
hook_void(UpdatePopulateMap, SpawnSkull,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnBesouroX()
hook_void(UpdatePopulateMap, SpawnXBeetle,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnFlowerChaufer()
hook_void(UpdatePopulateMap, SpawnChaufer,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnSibilante()
hook_void(UpdatePopulateMap, SpawnHisser,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnRosa()
hook_void(UpdatePopulateMap, SpawnPink,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnTrilobita()
hook_void(UpdatePopulateMap, SpawnTrilo,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnCianeto()
hook_void(UpdatePopulateMap, SpawnCyanide,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnFFlang()
hook_void(UpdatePopulateMap, SpawnFlang,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnLLugu()
hook_void(UpdatePopulateMap, SpawnLugu,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnFestivo()
hook_void(UpdatePopulateMap, SpawnFestive,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnManticora()
hook_void(UpdatePopulateMap, SpawnManticore,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnEEmp()
hook_void(UpdatePopulateMap, SpawnEmp,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnJJunc()
hook_void(UpdatePopulateMap, SpawnJunc,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnMariposaX()
hook_void(UpdatePopulateMap, SpawnXmoth,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end

function SpawnMariposadecaida()
hook_void(UpdatePopulateMap, SpawnDecmoth,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end
function SpawnVespaVermelha()
hook_void(UpdatePopulateMap, SpawnRedwasp,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end
function SpawnBButter()
hook_void(UpdatePopulateMap, SpawnButter,1)
gg.sleep(50)
endhook(UpdatePopulateMap ,1) 
gg.toast("Spawned ✅")
end
function SpawnRandomInsect()

HackersHouse.hijackParameters({
          
            { ['libName'] = "libil2cpp",
              ['offset'] = SpawnGold,
              ['parameters'] ={ { "bool", true}, }, 
              ['libIndex'] = 'auto'
            },
            
        })
 gg.sleep(50)
 hook_void(UpdatePopulateMap, SpawnGold,1)
 gg.sleep(12)
 endhook(UpdatePopulateMap ,1)
 HackersHouse.hijackParametersOff({
      { ['libName'] = "libil2cpp",
        ['offset'] = SpawnGold,
      }
    })
gg.toast("Spawned ✅")
end

  --[[HackersHouse.hijackParameters({
      { ['libName'] = "libil2cpp",
        ['offset'] = SpawnGold,
        ['parameters'] ={ { "bool", true}}, 
        ['libIndex'] = 'auto'
      }
    })
hook_void(UpdatePopulateMap, AwakePopulateMap,1)



    hook_void(AwakePopulateMap, SpawnGold, 1)
  
    
HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",          
                  ['targetOffset'] = AwakePopulateMap,
                  ['destinationOffset'] = SpawnGold,   
                  ['parameters'] ={ { "bool", true}}, 
                  ['repeat'] = 1,
                  ['libIndex'] = 'auto'
                }})
                gg.sleep(50)
                endhook(AwakePopulateMap,1)
 endhook(UpdatePopulateMap ,1)
]]
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖

function Fusao()
  
    local R = gg.prompt({"Evolução\n➖➖➖➖➖➖➖➖➖➖ [0; 200]"},
    { [1] = defaultValue },
    { [1] = "number" })

    if R == nil then 
        gg.toast("Cancelled") 
        return 
    end
      HackersHouse.returnValue({
        { ['libName'] = "libil2cpp",
          ['offset'] = ChanceFusion,
          ['valueType'] = "int",
          ['value'] = R[1],
          ['libIndex'] = 'auto'
        }
      })
end
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖

function Season()

local input = gg.prompt({"Digite o Valor 0 - 175"}, {' '}, {'HackersHouse'})

if input then
local valorSeason = tonumber(input[1])
if valorSeason ~= nil and valorSeason %1==0 then

HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",            --Update - Season
                  ['targetOffset'] = UpdateSeason,
                  ['destinationOffset'] = ClaimReward,    --ClaimReward - Season
                  ['parameters'] ={ { "int", valorSeason}}, 
                  ['repeat'] = 1,
                  ['libIndex'] = 'auto'
                }})
                gg.toast("sᴜᴄᴄᴇss")
               else gg.toast("Valor Incorreto")
              end
              
             else gg.toast("Cancelado")
   end
end
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖

function Gema()
HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",            --Update - Season
                  ['targetOffset'] = UpdateSeason,
                  ['destinationOffset'] = ClaimReward,    --ClaimReward - Season
                  ['parameters'] ={ { "int", 73}},
                  ['repeat'] = 20,
                  ['libIndex'] = 'auto'
                }})
                gg.toast("sᴜᴄᴄᴇss")
end
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖
function Fungo()
HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",            --Update - Season
                  ['targetOffset'] = UpdateSeason,
                  ['destinationOffset'] = ClaimReward,    --ClaimReward - Season
                  ['parameters'] ={ { "int", 93}}, 
                  ['repeat'] = 1,
                  ['libIndex'] = 'auto'
                }})
                gg.toast("sᴜᴄᴄᴇss")
end
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖
function Folha()
HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",            --Update - Season
                  ['targetOffset'] = UpdateSeason,
                  ['destinationOffset'] = ClaimReward,    --ClaimReward - Season
                  ['parameters'] ={ { "int", 94}}, 
                  ['repeat'] = 1,
                  ['libIndex'] = 'auto'
                }})
                gg.toast("sᴜᴄᴄᴇss")
end
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖
function Semente()
HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",            --Update - Season
                  ['targetOffset'] = UpdateSeason,
                  ['destinationOffset'] = ClaimReward,    --ClaimReward - Season
                  ['parameters'] ={ { "int", 95}}, 
                  ['repeat'] = 1,
                  ['libIndex'] = 'auto'
                }})
                gg.toast("sᴜᴄᴄᴇss")
end
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖
function Token()
HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",            --Update - Season
                  ['targetOffset'] = UpdateSeason,
                  ['destinationOffset'] = ClaimReward,    --ClaimReward - Season
                  ['parameters'] ={ { "int", 96}}, 
                  ['repeat'] = 1,
                  ['libIndex'] = 'auto'
                }})
                gg.toast("sᴜᴄᴄᴇss")
end
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖
function Resina()
HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",            --Update - Season
                  ['targetOffset'] = UpdateSeason,
                  ['destinationOffset'] = ClaimReward,    --ClaimReward - Season
                  ['parameters'] ={ { "int", 97}}, 
                  ['repeat'] = 10,
                  ['libIndex'] = 'auto'
                }})
                gg.toast("sᴜᴄᴄᴇss")
end
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖
function Agua()
HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",            --Update - Season
                  ['targetOffset'] = UpdateSeason,
                  ['destinationOffset'] = ClaimReward,    --ClaimReward - Season
                  ['parameters'] ={ { "int", 98}}, 
                  ['repeat'] = 10,
                  ['libIndex'] = 'auto'
                }})
                gg.toast("sᴜᴄᴄᴇss")
end
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖
function Melada()
HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",            --Update - Season
                  ['targetOffset'] = UpdateSeason,
                  ['destinationOffset'] = ClaimReward,    --ClaimReward - Season
                  ['parameters'] ={ { "int", 99}}, 
                  ['repeat'] = 10,
                  ['libIndex'] = 'auto'
                }})
                gg.toast("sᴜᴄᴄᴇss")
end
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖
function Inseto()
HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",            --Update - Season
                  ['targetOffset'] = UpdateSeason,
                  ['destinationOffset'] = ClaimReward,    --ClaimReward - Season
                  ['parameters'] ={ { "int", 100}}, 
                  ['repeat'] = 10,
                  ['libIndex'] = 'auto'
                }})
                gg.toast("sᴜᴄᴄᴇss")
end
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖
function FichaF()
HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",            --Update - Season
                  ['targetOffset'] = UpdateSeason,
                  ['destinationOffset'] = ClaimReward,    --ClaimReward - Season
                  ['parameters'] ={ { "int", 101}}, 
                  ['repeat'] = 10,
                  ['libIndex'] = 'auto'
                }})
                gg.toast("sᴜᴄᴄᴇss")
end
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖
function Flor()
HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",            --Update - Season
                  ['targetOffset'] = UpdateSeason,
                  ['destinationOffset'] = ClaimReward,    --ClaimReward - Season
                  ['parameters'] ={ { "int", 91}}, 
                  ['repeat'] = 10,
                  ['libIndex'] = 'auto'
                }})
                gg.toast("sᴜᴄᴄᴇss")
end
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖
function FichaS()
HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",            --Update - Season
                  ['targetOffset'] = UpdateSeason,
                  ['destinationOffset'] = ClaimReward,    --ClaimReward - Season
                  ['parameters'] ={ { "int", 61}}, 
                  ['repeat'] = 10,
                  ['libIndex'] = 'auto'
                }})
                gg.toast("sᴜᴄᴄᴇss")
end
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖
function Pulgao()
HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",            --Update - Season
                  ['targetOffset'] = UpdateSeason,
                  ['destinationOffset'] = ClaimReward,    --ClaimReward - Season
                  ['parameters'] ={ { "int", 49}}, 
                  ['repeat'] = 20,
                  ['libIndex'] = 'auto'
                }})
                gg.toast("sᴜᴄᴄᴇss")
end
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖

function Gold()

if Golden=="❌" then

HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = CheckBonusGolden,--CheckBonusGolden - ArmyMenu
        ['libIndex'] = 'auto'
      }
    })
hook_void(FuseBT, GoldenBT,1)--[[
HackersHouse.callAnotherMethod({
      { ['libName'] = "libil2cpp",
        ['targetOffset'] = FuseBT, --FuseBT -- ArmyMenu
        ['destinationOffset'] = GoldenBT, --GoldenBT - ArmyMenu
        ['parameters'] ={}, 
        ['libIndex'] = 'auto'
      }
    })]]
    
    Golden="✅"
    gg.toast("Changed ✅")
    gg.alert ("Selecionar Inseto")
    else
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = CheckBonusGolden
      }
    })
    endhook(FuseBT,1)--[[
    HackersHouse.callAnotherMethodOff({
      { ['libName'] = "libil2cpp",
        ['targetOffset'] = FuseBT
        }
         })]]
        
         Golden="❌"
            gg.toast("Changed ❌")
    end

end


function TP()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.clearList()
    gg.searchNumber("4 768 362 006 883 193 452", gg.TYPE_QWORD)
    gg.refineNumber("4 768 362 006 883 193 452", gg.TYPE_QWORD)

    local r = gg.getResults(gg.getResultsCount())
    gg.clearResults()
    gg.clearList()
    gg.sleep(400)

    local R = 5

    for i, v in ipairs(r) do
        v.address = v.address - 0x94 -- Alterar para a direção correta
        v.flags = 16
    end

    gg.loadResults(r)
    gg.sleep(800)
    gg.getResults(gg.getResultsCount())
    gg.editAll(R, 16)
    gg.toast("Alteração concluída com sucesso!")
end
---------------
function BeeMode()

if Bee== "❌" then Bee="✅"

 hook_void(UpdateMovePlayer, StartBee ,1)	
			gg.sleep(50)
			endhook(UpdateMovePlayer ,1)
			
                else
                

Hook_Void
(
UpdateMovePlayer, EndBee ,1  --Tp Colônia
) 
gg.sleep(50)
endhook(UpdateMovePlayer ,1)
                   Bee="❌"
end
end

function Colmeia()
hook_void(UpdateMovePlayer, StartBee, 1)
gg.sleep(50)
endhook(UpdateMovePlayer, 1)
--[[
HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",
                  ['targetOffset'] = UpdateMovePlayer,
                  ['destinationOffset'] = StartBee,  --StartBeeMode - Moveplayer
                  ['parameters'] ={}, 
                  ['repeat'] = 1,
                  ['libIndex'] = 'auto'
                }})
                ]]
hook_void
(
UpdateMovePlayer, TpColmeiaIn ,1)
gg.sleep(50)
endhook(UpdateMovePlayer ,1) --Tp Colméia


gg.sleep(1000)

gg.setRanges(gg.REGION_ANONYMOUS)
    gg.clearResults()
    gg.clearList()
    gg.searchNumber("4 768 362 006 883 193 452", gg.TYPE_QWORD)
    gg.refineNumber("4 768 362 006 883 193 452", gg.TYPE_QWORD)

    --[[local r = gg.getResults(gg.getResultsCount())]]
    local r2 = gg.getResults(gg.getResultsCount())
    gg.clearResults()
    gg.clearList()
    gg.sleep(400)

  --[[  local R = 226.88708496094]]
    local R2 = 231.64440917969          --TP rainha
    --[[ for i, v in ipairs(r) do
        v.address = v.address - 0x94
        v.flags = 16
    end]]
    for i, v in ipairs(r2) do
        v.address = v.address - 0x90 -- Alterar para a direção correta
        v.flags = 16
    end
--[[
    gg.loadResults(r)
    gg.getResults(gg.getResultsCount())
    gg.editAll(R, 16)
    ]]
    gg.loadResults(r2)
    gg.getResults(gg.getResultsCount())
    gg.editAll(R2, 16)
    gg.clearResults()
    gg.clearList()
    
    for i = 5, 1, -1 do
        gg.toast("Tempo restante: " .. i .. " segundos")
        gg.sleep(5000) -- 1 segundo (1000 ms)
    end

hook_void
(
UpdateMovePlayer, TpColmeiaOut ,1  --Tp Fora Colmeia

) 
gg.sleep(50)
endhook(UpdateMovePlayer ,1)

hook_void(UpdateMovePlayer, TpOutHill,1)   

endhook(UpdateMovePlayer ,1)

hook_void
(
UpdateMovePlayer, TpCasa ,1  --Tp Colônia
) 
gg.sleep(50)
endhook(UpdateMovePlayer ,1)
gg.sleep(500)

hook_void
(
UpdateMovePlayer, EndBee ,1  -- EndBeeMode
) 
gg.sleep(50)
endhook(UpdateMovePlayer ,1)
end

function CreatureEvent()
if Nozes == "❌" then Nozes ="✅"

HackersHouse.callAnotherMethod({
      { ['libName'] = "libil2cpp",
        ['targetOffset'] = ProgressEvent, ---- RaiseActivity -- CreatureEvent
        ['destinationOffset'] = AttractEvent, --Attract - CreatureEvent
        ['parameters'] ={}, 
        ['libIndex'] = 'auto'
      }
    })

        gg.setRanges(gg.REGION_ANONYMOUS)
            gg.clearResults()
            gg.clearList()
            gg.searchNumber("196 009 422 487 552", gg.TYPE_QWORD)
            gg.refineNumber("196 009 422 487 552", gg.TYPE_QWORD)
        
            local r2 = gg.getResults(gg.getResultsCount())
            gg.clearResults()
            gg.clearList()
            gg.sleep(400)
        
            for i, v in ipairs(r2) do
                v.address = v.address - 0x4 -- Alterar para a direção correta
                v.flags = 4
                v.value = 0
                v.freeze = true
            end
  
            gg.setValues(r2)
           -- gg.editAll(R2, 4)
            gg.addListItems(r2)
            gg.clearResults()
           -- gg.clearList()
    gg.alert ("ATUALIZE A BARRA DE PROGREÇÃO ✨")
            gg.sleep(500)
    gg.alert ("NOZES INFINITAS 🥜")
 else
 
         HackersHouse.callAnotherMethodOff({
              { ['libName'] = "libil2cpp",
                ['targetOffset'] = ProgressEvent, ---- RaiseActivity -- CreatureEvent
         }})
            gg.clearResults()
            gg.clearList()
            
            gg.sleep(700)
            
            gg.toast ("NOZES INFINITAS OFF 🥜")
            Nozes = "❌"
            
end
end

function AutoWin()

hook_void

(
UpdatePVPHandler, Win ,1)
gg.sleep(50)
endhook(UpdatePVPHandler ,1) -- Update/ Win --PVPHandler
gg.sleep(300)
gg.toast("GG!")
end

function BYPASS()
if bypassExecultado ~= false then 
os.remove("/storage/emulated/0/Documents/bypassStatus.txt")
API = gg.makeRequest('https://raw.githubusercontent.com/EiiAlves/Script/main/ByPass.lua').content
pcall(load(API))
end
end


function CamaraFolha()

hook_void
(
UpdateColonyMenu, CompleteLeaf ,1
) 
gg.sleep(10)
endhook(UpdateColonyMenu ,1)
end

function CamaraOvo()

hook_void
(
UpdateColonyMenu, CompleteEgg ,1
) 
gg.sleep(10)
endhook(UpdateColonyMenu ,1)
end

function CamaraRainha()

hook_void
(
UpdateColonyMenu, CompleteQueen ,1
) 
gg.sleep(10)
endhook(UpdateColonyMenu ,1)
end

function  CamaraInseto()

hook_void
(
UpdateColonyMenu, CompleteInsect ,1
) 
gg.sleep(10)
endhook(UpdateColonyMenu ,1)
end

function CamaraResina()

hook_void
(
UpdateColonyMenu, CompleteResine ,1
) 
gg.sleep(10)
endhook(UpdateColonyMenu ,1)
end

function CamaraMel()

hook_void
(
UpdateColonyMenu, CompleteHoney ,1
) 
gg.sleep(10)
endhook(UpdateColonyMenu ,1)
end

function CamaraAgua()

hook_void
(
UpdateColonyMenu, CompleteWater ,1
) 
gg.sleep(10)
endhook(UpdateColonyMenu ,1)
end

function CamaraFungo()

hook_void
(
UpdateColonyMenu, CompleteFood ,1
) 
gg.sleep(10)
endhook(UpdateColonyMenu ,1)
end

function CamaraEscravidao()

hook_void
(
UpdateColonyMenu, CompleteSlave ,1
) 
gg.sleep(10)
endhook(UpdateColonyMenu ,1)
end

function CamaraSemente()

hook_void
(
UpdateColonyMenu, CompleteSeed ,1
) 
gg.sleep(10)
endhook(UpdateColonyMenu ,1)
end


function AtracctGold()


HackersHouse.callAnotherMethod({
      { ['libName'] = "libil2cpp",
        ['targetOffset'] = ClickConvert,
        ['destinationOffset'] = SkinGold,
        ['parameters'] ={}, 
        ['libIndex'] = 'auto'
      }
    })
end

function Verify()
             if gg.isVisible() then
             Trof="❌"
             gg.toast("ENCERRANDO...")
  
     HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = LoadCoolDown
      }
    })
    HackersHouse.callAnotherMethodOff({
      { ['libName'] = "libil2cpp",
        ['targetOffset'] = GetPlayer
      }
    })
   -- SpeedTimerTrofOff()
    end
    
end

function FarmTrof()
        if Trof == "❌" then Trof ="✅"
        --SpeedTimerTrof()
          HackersHouse.disableMethod({
                  { ['libName'] = "libil2cpp", 
                    ['offset'] = LoadCoolDown, 
                    ['libIndex'] = 'auto'
                  }
                })
                hook_void(GetPlayer, GetPlayerBot, 1)--[[
           HackersHouse.callAnotherMethod({
              { ['libName'] = "libil2cpp",
                ['targetOffset'] = GetPlayer,
                ['destinationOffset'] = GetPlayerBot,
                ['parameters'] ={}, 
                ['libIndex'] = 'auto'
              }
            })]]
                
                while Trof=="✅" do 
                Verify()
                gg.sleep(1000)
                Verify()
                hook_void
                (
                UpdateFindOpponent, FindAndRemoveShield ,1
                ) 
                gg.sleep(300)
                endhook(UpdateFindOpponent ,1)
                gg.sleep(10000)
               Verify() 
                hook_void                
                (
                UpdatePVPHandler, Win ,1)
                gg.sleep(300)
                endhook(UpdatePVPHandler ,1)
                gg.sleep(500)
             
                Verify()   
                hook_void
                (
                UpdatePVPHandler, Continue,1
                ) 
                gg.sleep(300)
                endhook(UpdatePVPHandler ,1)
                
     
                gg.toast("Farmando...")             
                

             end
        else 
        gg.toast(Trof)
        end
end

local Skin="Off"

function SkinPass()
if Skin=="On" then 
HackersHouse.callAnotherMethodOff({
            {
                ['libName'] = "libil2cpp",
                ['targetOffset'] = ClickSkin
            }
        })
Skin="Off"
end
end

function AllSkin()
if Skin=="Off" then Skin="On"
while Skin=="On" do
gg.sleep(500)
    for i = 0, 200 do
        HackersHouse.returnValue({
        { ['libName'] = "libil2cpp",
          ['offset'] = UnlockSeasonSkin,
          ['valueType'] = "int",
          ['value'] = i,
          ['libIndex'] = 'auto'
        }
      })
        if gg.isVisible() then  
        SkinPass()
        gg.toast(Skin)
        break
        end
        
        gg.sleep(500)
        gg.toast("Skin"..i)
    end
    end
     gg.sleep(300)
 end               
    gg.toast("Ok")
end

function InstaCapture()
hook_void(UpdateFlowerSeeds, ActivateInstaCapture, 1)
--[[HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",            --Update - Season
                  ['targetOffset'] = UpdateFlowerSeeds,
                  ['destinationOffset'] = ActivateInstaCapture,    --ClaimReward - Season
                  ['parameters'] ={}, 
                  ['repeat'] = 1,
                  ['libIndex'] = 'auto'
                }})]]
                gg.toast("sᴜᴄᴄᴇss")
                
end






--Package-------->com,ariel,zanyants
--Version-------->0,1010
--Arch-------->x64
---------------------------------------------------------


--Package-------->com,ariel,zanyants
--Version-------->0,1010
--Arch-------->x64
---------------------------------------------------------
AntPlayerDung=0x362B34
FindAndRemoveShield=0x39E164
SpawnEscorpiao=0x4FDE78
SpawnFlowerm=0x4FFB1C
SuspChambers=0x5F7138
TpArvoreOut=0x4BA6B8
Continue=0x577D8C
CompleteEgg=0x782344
CheckBonusGolden=0x2FC1AC
CompleteQueen=0x781D98
CompleteLeaf=0x781974
SpawnVespaAsiatica=0x504678
SpawnLibelula=0x4FD0DC
SpawnHisser=0x501DCC
SpawnFlang=0x502974
UpdatePVPHandler=0x577890
FuseBT=0x306E8C
TpRedAnts=0x4B9E8C
SpawnBorboletaAzul=0x4FDB90
SpawnButter=0x503DC0
SpawnJunc=0x503AE4
UpdatePopulateMap=0x5077D0
EndBee=0x4B3498
AntSoldado=0x3F842C
SpawnTrilo=0x5023A0
SpawnRedwasp=0x500C8C
SpawnXBeetle=0x501814
ClickSkin=0x6CBA70
BombardierPVP=0x5345BC
LoadCoolDown=0x39ECD4
CompleteInsect=0x781F14
SpawnAntler=0x5009A4
StartBee=0x4B3204
UpdateFindOpponent=0x39F9AC
Susp=0x5F56A4
UpdateSeason=0x6BEC00
SpawnSkimmer=0x5003D4
SpawnEmerald=0x5006BC
AntWorker=0x4EE948
RushPlayer=0x3F38A8
CompleteResine=0x782774
Bombardier=0x5B7C94
SpawnBesouroRhino=0x4FE09C
TpCasa=0x4B981C
PvpCannon=0x53C960
CompleteHoney=0x78255C
CancelDung=0x35E1C0
SpawnManticore=0x50322C
AttractEvent=0x349144
Leaves=0x48D270
SpawnXmoth=0x5040A8
SpawnLugu=0x502C5C
CompleteWater=0x7829B8
SpawnCentopeia=0x4FE2C0
PartInse=0x6D450C
UpdateColonyMenu=0x77FAAC
AwakePopulateMap=0x4F3FBC
SpawnEmp=0x5037FC
GoldenBT=0x3037EC
SpawnBombardeiro=0x4FD96C
SpawnCyanide=0x50267C
OnApplicationQuit=0x5F7668
ProgressEvent=0x349B64
ChanceFusion=0x30AD24
SpawnGhost=0x4FF54C
SpawnFirefly=0x500F74
UnlockSeasonSkin=0x6BD100
AntPlayer=0x4C273C
SpawnAranha=0x4FD300
GetPlayer=0x39F134
SpawnGold=0x4FC058
AutoBan=0x5F4BC4
CompleteFood=0x781710
AntSoldierPvP=0x5A6BF8
TpColmeiaIn=0x4BA9E0
SpawnChaufer=0x501AF0
GetIp=0x46ABB0
TpDungeon=0x4BC220
SpawnOrchid=0x4FF834
SpawnJewel=0x4FFE04
CentAbility=0x74E90C
UpdateFarmInsect=0x6FD3D4
SpawnPink=0x5020A8
CompleteSeed=0x781B8C
SpawnBesouroTigre=0x4FD748
Seed=0x6C7508
UpdatePvpCannon=0x53DC70
TpColmeiaOut=0x4BAE88
SpawnDecmoth=0x504390
CompleteSlave=0x78212C
RewardInsect=0x6FE670
SpawnSkull=0x50125C
SpawnFestive=0x502F44
UpdateFlowerSeeds=0x3B6994
GetPlayerBot=0x39F134
ClaimReward=0x6BD974
TpOutHill=0x4B9B1C
SpawnPennant=0x5000EC
SaveDevice=0x5F13E4
SpawnLouvaDeus=0x4FD524
ActivateInstaCapture=0x3B3014
AntPlayerCoop=0x4D5764
RBeetleAbility=0x5E0004
UpdateMovePlayer=0x4BD434
AntPlayerPvp=0x4E5174
Resine=0x6A18F4
HoneyReward=0x35F3C4
Win=0x577E48
while true do
if gg.isVisible(true)then
gg.setVisible(false)
gg.clearResults()
gg.clearList()
START()
end
end




