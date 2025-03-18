--[[
    Tool : Method Patching Library
    Made By : Hackers House
    Version : 1
    Brodcast Channel : https://t.me/Hackers_House_YT
    Chat Support : https://t.me/Hackers_House_YT_chat_group
    Official Documentation : https://HackersHouse.tech/method-patching-library-game-guardian
]]

io.open("Method_Patching_Library_V1.lua","w+"):write(gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/Method_Patching_Library_V1.lua").content):close()
require('Method_Patching_Library_V1')

io.open("APIMannel.lua","w+"):write(gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/APIMannel.lua").content):close()
require('APIMannel')

io.open("login.lua","w+"):write(gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/login.lua").content):close()
require('login')

io.open("versionUp.lua","w+"):write(gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/versionUp.lua").content):close()
require('versionUp')
--[[io.open("ByPass.lua","w+"):write(gg.makeRequest("https://raw.githubusercontent.com/EiiAlves/Script/main/ByPass.lua").content):close()
require('ByPass')]]

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


-- Função do menu

function START()
    if not usuario or not dados.expira_em then
        gg.alert("❌ Erro: Usuário não logado ou dados inválidos.")
        os.exit()
    end
if not bypassExecutado then
        API = gg.makeRequest('https://raw.githubusercontent.com/EiiAlves/Script/main/ByPass.lua').content
pcall(load(API))
end
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
        menu = gg.multiChoice({Leafs.."Folha Infinita", Resine.."Resina Infinita", Seeds.."Semente Infinita", Insect.."Inseto Infinito"})
        if menu == nil then START() return end

        if menu[3] then Semente() end
        if menu[1] then Folha() end
        if menu[2] then Resina() end
        if menu[4] then Inseto() end
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
                "InstaCapture"
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
                    if new_menu[4] then SpawnJóia() end
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
                    if new_menu[25] then SpawnMariposaDecaída() end
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
        HackersHouse.callAnotherMethod({
      { ['libName'] = "libil2cpp",
        ['targetOffset'] = CancelDung, 
        ['destinationOffset'] = HoneyReward, 
        ['parameters'] ={}, 
        ['libIndex'] = 'auto'
      }
    })
    Mel="✅"
    else
    HackersHouse.callAnotherMethodOff({
      { ['libName'] = "libil2cpp",
        ['targetOffset'] = CancelDung, 
        }}) Mel="❌"
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

function Folha()
    if Leafs == "❌" then Leafs = "✅"
    
    HackersHouse.disableMethod({
      { ['libName'] = "libil2cpp", 
        ['offset'] = Leaves,
        ['libIndex'] = 'auto'
      }
    })
 gg.toast("Changed ✅")
    elseif Leaf == "✅" then
    HackersHouse.disableMethodOff({
      { ['libName'] = "libil2cpp", 
        ['offset'] = Leaves,
      }
    })
     Leafs = "❌"
 gg.toast("Changed ❌")
end
end

function Semente()
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

function Resina()
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

function Inseto()
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

function SpawnJóia()
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

function SpawnMariposaDecaída()
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
hook_void(UpdatePopulateMap, AwakePopulateMap,1)

HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",          
                  ['targetOffset'] = AwakePopulateMap,
                  ['destinationOffset'] = SpawnGold,   
                  ['parameters'] ={ { "bool", true}}, 
                  ['repeat'] = 1,
                  ['libIndex'] = 'auto'
                }})
                gg.sleep(50)
 endhook(UpdatePopulateMap ,1)

gg.toast("Spawned ✅")
end

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

HackersHouse.callAnotherMethod({
      { ['libName'] = "libil2cpp",
        ['targetOffset'] = FuseBT, --FuseBT -- ArmyMenu
        ['destinationOffset'] = GoldenBT, --GoldenBT - ArmyMenu
        ['parameters'] ={}, 
        ['libIndex'] = 'auto'
      }
    })
    
    Golden="✅"
    gg.toast("Changed ✅")
    gg.alert ("Selecionar Inseto")
    else
    HackersHouse.callAnotherMethodOff({
      { ['libName'] = "libil2cpp",
        ['targetOffset'] = FuseBT
        }
         })
        
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
HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",
                  ['targetOffset'] = UpdateMovePlayer,
                  ['destinationOffset'] = StartBee,  --StartBeeMode - Moveplayer
                  ['parameters'] ={}, 
                  ['repeat'] = 1,
                  ['libIndex'] = 'auto'
                }})
                
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
           HackersHouse.callAnotherMethod({
              { ['libName'] = "libil2cpp",
                ['targetOffset'] = GetPlayer,
                ['destinationOffset'] = GetPlayerBot,
                ['parameters'] ={}, 
                ['libIndex'] = 'auto'
              }
            })
                
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
HackersHouse.voidHook({

                { ['libName'] = "libil2cpp",            --Update - Season
                  ['targetOffset'] = UpdateFlowerSeeds,
                  ['destinationOffset'] = ActivateInstaCapture,    --ClaimReward - Season
                  ['parameters'] ={}, 
                  ['repeat'] = 1,
                  ['libIndex'] = 'auto'
                }})
                gg.toast("sᴜᴄᴄᴇss")
end

function executeRemoteScript(url)
    local response = gg.makeRequest(url)
    
    if response and response.content then
        local func, err = load(response.content)
        if func then
            func()
        else
            gg.alert("Erro ao carregar o script: " .. err)
        end
    else
        gg.alert("Erro ao baixar o script.")
    end
end

executeRemoteScript("https://raw.githubusercontent.com/EiiAlves/Script/main/Offset.lua")





--Package-------->com,ariel,zanyants
--Version-------->0,1010
--Arch-------->x64
---------------------------------------------------------
--[[AntPlayerDung=0x36124C
FindAndRemoveShield=0x39D324
SpawnEscorpiao=0x4F8554
SpawnFlowerm=0x4FA1F8
SuspChambers=0x5ECBA8
TpArvoreOut=0x4B4B70
CompleteEgg=0x773870
CheckBonusGolden=0x2FC3DC
CompleteQueen=0x7732C4
CompleteLeaf=0x772EA0
SpawnVespaAsiatica=0x4FE790
SpawnLibelula=0x4F77B8
SpawnHisser=0x4FC1CC
SpawnFlang=0x4FCD74
UpdatePVPHandler=0x56FD38
FuseBT=0x306CEC
TpRedAnts=0x4B4344
SpawnBorboletaAzul=0x4F826C
SpawnButter=0x4FDED8
SpawnJunc=0x4FDBFC
UpdatePopulateMap=0x501698
EndBee=0x4ADB5C
AntSoldado=0x3F6EDC
SpawnTrilo=0x4FC7A0
SpawnXBeetle=0x4FBC14
ClickSkin=0x6B00F0
BombardierPVP=0x52CB8C
LoadCoolDown=0x39ED20
CompleteInsect=0x773440
SpawnAntler=0x4FB080
StartBee=0x4AD8C8
UpdateFindOpponent=0x39DC54
Susp=0x5EB114
UpdateSeason=0x6B1BF0
SpawnSkimmer=0x4FAAB0
SpawnEmerald=0x4FAD98
AntWorker=0x4E93EC
RushPlayer=0x3F234C
CompleteResine=0x773CA0
Bombardier=0x5AF890
SpawnBesouroRhino=0x4F8778
TpCasa=0x4B3CD4
PvpCannon=0x534F30
CompleteHoney=0x773A88
CancelDung=0x35CDA0
SpawnManticore=0x4FD62C
AttractEvent=0x347F00
Leaves=0x487C54
SpawnXmoth=0x4FE1C0
SpawnLugu=0x4FD05C
CompleteWater=0x773EE4
SpawnCentopeia=0x4F899C
PartInse=0x6C69B8
UpdateColonyMenu=0x7710A0
AwakePopulateMap=0x4EEA74
SpawnEmp=0x4FD914
GoldenBT=0x303754
SpawnBombardeiro=0x4F8048
SpawnCyanide=0x4FCA7C
OnApplicationQuit=0x5ED0D8
ProgressEvent=0x348880
ChanceFusion=0x30A944
SpawnGhost=0x4F9C28
SpawnFirefly=0x4FB650
AntPlayer=0x4BC9D8
SpawnAranha=0x4F79DC
GetPlayer=0x39F254
SpawnGold=0x4F6734
AutoBan=0x5EA630
CompleteFood=0x772C3C
AntSoldierPvP=0x59ECB4
TpColmeiaIn=0x4B4E98
SpawnChaufer=0x4FBEF0
GetIp=0x469B28
TpDungeon=0x4B66D8
SpawnOrchid=0x4F9F10
SpawnJewel=0x4FA4E0
CentAbility=0x73FAE0
UpdateFarmInsect=0x6EEFF8
SpawnPink=0x4FC4A8
CompleteSeed=0x7730B8
SpawnBesouroTigre=0x4F7E24
Seed=0x6BA15C
UpdatePvpCannon=0x536240
TpColmeiaOut=0x4B5340
SpawnDecmoth=0x4FE4A8
CompleteSlave=0x773658
RewardInsect=0x6F0294
SpawnSkull=0x4FB938
SpawnFestive=0x4FD344
UpdateFlowerSeeds=0x3B5898
GetPlayerBot=0x39F254
ClaimReward=0x6B0964
TpOutHill=0x4B3FD4
SpawnPennant=0x4FA7C8
SaveDevice=0x5E79A0
SpawnLouvaDeus=0x4F7C00
ActivateInstaCapture=0x3B1F14
AntPlayerCoop=0x4CF528
UpdateMovePlayer=0x4B78EC
AntPlayerPvp=0x4DECF0
Resine=0x695500
HoneyReward=0x35DDF0
Win=0x5702EC
Continue=0x570230]]
while true do
if gg.isVisible(true)then
gg.setVisible(false)
gg.clearResults()
gg.clearList()
START()
end
end




