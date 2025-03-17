local m = gg.getTargetInfo()
if m.x64 == true then
Xbit='x64 '
else
Xbit='x32 '
end 
gg.setVisible(false)
local checkTarget = 0
	local info = gg.getTargetInfo()
	local check = false
	local current = false
		check = targetPkg
		current = info.packageName
		Package = current
		Version =  info.versionName
InfoGame=
'\n-- Package  -------->  '..current..''..
'\n-- Version  -------->  '..info.versionName..''..
'\n-- Arch   -------->  '..Xbit..''..
'\n---------------------------------------------------------'

-------- OPEN API
io.open("Il2cppApi.lua","w+"):write(gg.makeRequest("https://raw.githubusercontent.com/kruvcraft21/GGIl2cpp/master/build/Il2cppApi.lua").content):close()
require('Il2cppApi')
Il2cpp({il2cppVersion = 27})
gg.setVisible(false)



------ CLASSES

MovePlayer='MovePlayer'
PopulateMap='PopulateMap'
Bee='Bee'
LeavesScript='LeavesScript'
SeedScript='SeedScript'
PVPBombardierEnemy='PVPBombardierEnemy'
ArmyMenu='ArmyMenu'
Timers='Timers'
DungMovePlayer='DungMovePlayer'
BlackSoldier='BlackSoldier'
MovePlayerCoop='MovePlayerCoop'
MovePlayerPVP='MovePlayerPVP'
BlackWorker='BlackWorker'
PVPSoldier='PVPSoldier'
Bombardier='Bombardier'
DungeonGenerator='DungeonGenerator'
ResineScript='ResineScript'
SpiderResScript='SpiderResScript'
Season ='Season'
CreatureEvent ='CreatureEvent'
PVPHandler ='PVPHandler'
PVPCannon='PVPCannon'
LoadPuntos ='LoadPuntos'
SaveData ='SaveData'
ColonyMenu='ColonyMenu'
FindOpponent='FindOpponent'
FlowerSeeds='FlowerSeeds'
Cent='Cent'
RBeetle='RBeetle'
SkinManager='SkinManager'


--------- METODOS
StartBee='StartBeeMode'
UpdateMovePlayer='Update'
EndBee='EndBeeMode'
UpdatePopulateMap='Update'
SpawnAranha='SpawnSpider'
SpawnLouvaDeus='SpawnMantis'
SpawnBombardeiro='SpawnBombardier'
SpawnBesouroTigre='SpawnTBeetle'
SpawnEscorpiao='SpawnScorpion'
SpawnBorboletaAzul='SpawnCbutter'
SpawnBesouroRhino='SpawnRBeetle'
SpawnLibelula='SpawnDragon'
SpawnVespaAsiatica='SpawnHornet'
SpawnCentopeia='SpawnCent'
RushPlayer='RushPlayer'
Leaves='GetResource'
Seed='GetResource'
TpColmeiaIn='MoveInBeehive'
TpColmeiaOut='MoveOutBeehive'
Win='Win'
TpCasa='MoveToAntHill'
TpRedAnts='MoveToREDAntHill'
TpDungeon='MoveDungeon'
TpArvoreOut='MoveDownTree'
BombardierPVP='FindBlackAnts'
ChanceFusion='GetChance'
UpdateFarmInsect='Update'
RewardInsect='VineReward'
AntPlayerDung='Die'
AntSoldado='Die'
AntPlayer='Die'
AntPlayerCoop='Die'
AntPlayerPvp='Die'
AntWorker='Die'
AntSoldierPvP='Die'
Bombardier='FindBlackAnts'
SpawnGold='SpawnRandomInsect'
HoneyReward='GiveHoneyReward'
CancelDung='CancelDung'
CheckBonusGolden='CheckBonusGolden'
GoldenBT='GoldenBT'
FuseBT='FuseBT'
Resine ='GetResource'
PartInse='GetResource'
TpOutHill='MoveOUTAntHill'
UpdateSeason ='Update'
ClaimReward ='ClaimReward'
ProgressEvent ='RaiseActivity'
AttractEvent = 'Attract'
UpdatePVPHandler ='Update'
PvpCannon = 'FindBlackAnts'
UpdatePvpCannon='Update'
GetIp = 'GetIp'
AutoBan ='AutoBan'
OnApplicationQuit ='OnApplicationQuit'
SaveDevice ='SaveDevice'
SuspChambers ='SuspChambers'
Susp ='Susp'
CompleteInsect='CompleteInsect'
CompleteSlave='CompleteSlave'
CompleteWater='CompleteWater'               
CompleteResine='CompleteResine'
CompleteHoney='CompleteHoney'
CompleteLeaf='CompleteLeaf'
CompleteFood='CompleteFood'
CompleteSeed='CompleteSeed'
CompleteQueen='CompleteQueen'
CompleteEgg='CompleteEgg'
UpdateColonyMenu='Update'
AwakePopulateMap='Awake'
FindAndRemoveShield='FindAndRemoveShield'
UpdateFindOpponent='Update'
SpawnGhost='SpawnGhost'
SpawnOrchid='SpawnOrchid'
SpawnFlowerm='SpawnFlowerm'
SpawnJewel='SpawnJewel'
SpawnPennant='SpawnPennant'
SpawnSkimmer='SpawnSkimmer'
SpawnEmerald='SpawnEmerald'
SpawnAntler='SpawnAntler'
SpawnFirefly='SpawnFirefly'
SpawnSkull='SpawnSkull'
SpawnXBeetle='SpawnXBeetle'
SpawnChaufer='SpawnChaufer'
SpawnHisser='SpawnHisser'
SpawnPink='SpawnPink'
SpawnTrilo='SpawnTrilo'
SpawnCyanide='SpawnCyanide'
SpawnFlang='SpawnFlang'
SpawnLugu='SpawnLugu'
SpawnFestive='SpawnFestive'
SpawnManticore='SpawnManticore'
SpawnEmp='SpawnEmp'
SpawnJunc='SpawnJunc'
SpawnButter='SpawnButter'
SpawnXmoth='SpawnXmoth'
SpawnDecmoth='SpawnDecmoth'
ActivateInstaCapture='ActivateInstaCapture'
UpdateFlowerSeeds='Update'
GetPlayerBot='GetPlayerBot'
GetPlayer='GetPlayerBot'
Continue='Continue'
LoadCoolDown='LoadCoolDown'
SpawnRedwasp='SpawnRedwasp'
CentAbility='Ability'
RBeetleAbility='Ability'
ClickSkin='ClickSkin'
UnlockSeasonSkin='UnlockSeasonSkin'
----- IMPUT METHOD
Fsearch = Il2cpp.FindMethods({
    StartBee,
     UpdateMovePlayer, 
     EndBee, 
     UpdatePopulateMap, 
     SpawnAranha, 
     SpawnLouvaDeus, 
    SpawnBombardeiro, 
    SpawnBesouroTigre, 
    SpawnEscorpiao, 
    SpawnBorboletaAzul, 
    SpawnBesouroRhino, 
    SpawnLibelula, 
    SpawnVespaAsiatica, 
    SpawnCentopeia, 
    RushPlayer, 
    Leaves, 
    Seed, 
    TpColmeiaIn, 
    TpColmeiaOut, 
    Win, 
    TpCasa, 
    TpRedAnts, 
    TpDungeon, 
    TpArvoreOut, 
    BombardierPVP, 
    ChanceFusion, 
    UpdateFarmInsect, 
    RewardInsect, 
    AntPlayerDung, 
    AntSoldado, 
    AntPlayer, 
    AntPlayerCoop, 
    AntPlayerPvp, 
    AntWorker, 
    AntSoldierPvP, 
    Bombardier, 
    SpawnGold, 
    HoneyReward, 
    CancelDung, 
    CheckBonusGolden, 
    GoldenBT, 
    FuseBT, 
    Resine, 
    PartInse, 
    TpOutHill, 
    UpdateSeason, 
    ClaimReward, 
    ProgressEvent, 
    AttractEvent, 
    PvpCannon, 
    UpdatePvpCannon, 
    GetIp, 
    AutoBan, 
    OnApplicationQuit, 
    SaveDevice, 
    SuspChambers, 
    Susp, 
    UpdatePVPHandler,
    CompleteInsect,
    CompleteSlave,
    CompleteWater,
    CompleteResine,
    CompleteHoney,
    CompleteLeaf,
    CompleteFood,
    CompleteSeed,
    CompleteQueen,
    CompleteEgg,
    UpdateColonyMenu,
    AwakePopulateMap,
    FindAndRemoveShield,
    UpdateFindOpponent,
    SpawnGhost, 
    SpawnOrchid, 
    SpawnFlowerm, 
    SpawnJewel, 
    SpawnPennant, 
    SpawnSkimmer, 
    SpawnEmerald, 
    SpawnAntler, 
    SpawnFirefly, 
    SpawnSkull, 
    SpawnXBeetle, 
    SpawnChaufer, 
    SpawnHisser, 
    SpawnPink, 
    SpawnTrilo, 
    SpawnCyanide, 
    SpawnFlang, 
    SpawnLugu, 
    SpawnFestive, 
    SpawnManticore, 
    SpawnEmp, 
    SpawnJunc, 
    SpawnButter, 
    SpawnXmoth, 
    SpawnDecmoth,
    ActivateInstaCapture,
    UpdateFlowerSeeds,
    GetPlayerBot,
    GetPlayer,
    Continue,
    LoadCoolDown,
    CentAbility,
    RBeetleAbility,
    ClickSkin,
    UnlockSeasonSkin


})


-- Tabela de Métodos e Classes
MethodMap = {
    [1] = {"StartBee", "MovePlayer"},
    [2] = {"UpdateMovePlayer", "MovePlayer"},
    [3] = {"EndBee", "MovePlayer"},
    [4] = {"UpdatePopulateMap", "PopulateMap"},
    [5] = {"SpawnAranha", "PopulateMap"},
    [6] = {"SpawnLouvaDeus", "PopulateMap"},
    [7] = {"SpawnBombardeiro", "PopulateMap"},
    [8] = {"SpawnBesouroTigre", "PopulateMap"},
    [9] = {"SpawnEscorpiao", "PopulateMap"},
    [10] = {"SpawnBorboletaAzul", "PopulateMap"},
    [11] = {"SpawnBesouroRhino", "PopulateMap"},
    [12] = {"SpawnLibelula", "PopulateMap"},
    [13] = {"SpawnVespaAsiatica", "PopulateMap"},
    [14] = {"SpawnCentopeia", "PopulateMap"},
    [15] = {"RushPlayer", "Bee"},
    [16] = {"Leaves", "LeavesScript"},
    [17] = {"Seed", "SeedScript"},
    [18] = {"TpColmeiaIn", "MovePlayer"},
    [19] = {"TpColmeiaOut", "MovePlayer"},
    [20] = {"Win", "PVPHandler"},
    [21] = {"TpCasa", "MovePlayer"},
    [22] = {"TpRedAnts", "MovePlayer"},
    [23] = {"TpDungeon", "MovePlayer"},
    [24] = {"TpArvoreOut", "MovePlayer"},
    [25] = {"BombardierPVP", "PVPBombardierEnemy"},
    [26] = {"ChanceFusion", "ArmyMenu"},
    [27] = {"UpdateFarmInsect", "Timers"},
    [28] = {"RewardInsect", "Timers"},
    [29] = {"AntPlayerDung", "DungMovePlayer"},
    [30] = {"AntSoldado", "BlackSoldier"},
    [31] = {"AntPlayer", "MovePlayer"},
    [32] = {"AntPlayerCoop", "MovePlayerCoop"},
    [33] = {"AntPlayerPvp", "MovePlayerPVP"},
    [34] = {"AntWorker", "BlackWorker"},
    [35] = {"AntSoldierPvP", "PVPSoldier"},
    [36] = {"Bombardier", "Bombardier"},
    [37] = {"SpawnGold", "PopulateMap"},
    [38] = {"HoneyReward", "DungeonGenerator"},
    [39] = {"CancelDung", "DungeonGenerator"},
    [40] = {"CheckBonusGolden", "ArmyMenu"},
    [41] = {"GoldenBT", "ArmyMenu"},
    [42] = {"FuseBT", "ArmyMenu"},
    [43] = {"Resine", "ResineScript"},
    [44] = {"PartInse", "SpiderResScript"},
    [45] = {"TpOutHill", "MovePlayer"},
    [46] = {"UpdateSeason", "Season"},
    [47] = {"ClaimReward", "Season"},
    [48] = {"ProgressEvent", "CreatureEvent"},
    [49] = {"AttractEvent", "CreatureEvent"},
    [50] = {"PvpCannon", "PVPCannon"},
    [51] = {"UpdatePvpCannon", "PVPCannon"},
    [52] = {"GetIp", "LoadPuntos"},
    [53] = {"AutoBan", "SaveData"},
    [54] = {"OnApplicationQuit", "SaveData"},
    [55] = {"SaveDevice", "SaveData"},
    [56] = {"SuspChambers", "SaveData"},
    [57] = {"Susp", "SaveData"},
    [58] = {"UpdatePVPHandler", "PVPHandler"},
    [59] = {"CompleteInsect", "ColonyMenu"},
    [60] = {"CompleteSlave", "ColonyMenu"},
    [61] = {"CompleteWater", "ColonyMenu"},
    [62] = {"CompleteResine", "ColonyMenu"},
    [63] = {"CompleteHoney", "ColonyMenu"},
    [64] = {"CompleteLeaf", "ColonyMenu"},
    [65] = {"CompleteFood", "ColonyMenu"},
    [66] = {"CompleteSeed", "ColonyMenu"},
    [67] = {"CompleteQueen", "ColonyMenu"},
    [68] = {"CompleteEgg", "ColonyMenu"},
    [69] = {"UpdateColonyMenu", "ColonyMenu"},
    [70] = {"AwakePopulateMap", "PopulateMap"},
    [71] = {"FindAndRemoveShield", "FindOpponent"},
    [72] = {"UpdateFindOpponent", "FindOpponent"},
    [73] = {"SpawnGhost", "PopulateMap"},
    [74] = {"SpawnOrchid", "PopulateMap"},
    [75] = {"SpawnFlowerm", "PopulateMap"},
    [76] = {"SpawnJewel", "PopulateMap"},
    [77] = {"SpawnPennant", "PopulateMap"},
    [78] = {"SpawnSkimmer", "PopulateMap"},
    [79] = {"SpawnEmerald", "PopulateMap"},
    [80] = {"SpawnAntler", "PopulateMap"},
    [81] = {"SpawnFirefly", "PopulateMap"},
    [82] = {"SpawnSkull", "PopulateMap"},
    [83] = {"SpawnXBeetle", "PopulateMap"},
    [84] = {"SpawnChaufer", "PopulateMap"},
    [85] = {"SpawnHisser", "PopulateMap"},
    [86] = {"SpawnPink", "PopulateMap"},
    [87] = {"SpawnTrilo", "PopulateMap"},
    [88] = {"SpawnCyanide", "PopulateMap"},
    [89] = {"SpawnFlang", "PopulateMap"},
    [90] = {"SpawnLugu", "PopulateMap"},
    [91] = {"SpawnFestive", "PopulateMap"},
    [92] = {"SpawnManticore", "PopulateMap"},
    [93] = {"SpawnEmp", "PopulateMap"},
    [94] = {"SpawnJunc", "PopulateMap"},
    [95] = {"SpawnButter", "PopulateMap"},
    [96] = {"SpawnXmoth", "PopulateMap"},
    [97] = {"SpawnDecmoth", "PopulateMap"},
    [98] = {"ActivateInstaCapture","FlowerSeeds"},
    [99] = {"UpdateFlowerSeeds", "FlowerSeeds"},
    [100] = {"GetPlayerBot", "FindOpponent"},
    [101] = {"GetPlayer", "FindOpponent"},
    [102] = {"Continue", "PVPHandler"},
    [103] = {"LoadCoolDown", "FindOpponent"},
    [104] = {"SpawnRedwasp", "PopulateMap"},
    [105] = {"CentAbility", "Cent"},
    [106] = {"RBeetleAbility","RBeetle"},
    [107] = {"ClickSkin", "SkinManager"},
    [108] = {"UnlockSeasonSkin","SkinManager"}
    
    
}



-- Loop para encontrar os offsets
Results = {}

for index, method in ipairs(Fsearch) do
    local varName, className = table.unpack(MethodMap[index])
    
    for _, v in ipairs(method) do
        if v.ClassName == className then
            Results[varName] = "0x"..v.Offset
            break
        end
    end
end


