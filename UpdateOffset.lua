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






--------- METODOS

StartBee='StartBeeMode'

UpdateMovePlayer='Update'

EndBee='EndBeeMode'



----- IMPUT METHOD

Fsearch = Il2cpp.FindMethods({
    StartBee,

     UpdateMovePlayer, 

     EndBee, 

         
})





-- Tabela de Métodos e Classes

MethodMap = {

    [1] = {"StartBee", "MovePlayer"},

    [2] = {"UpdateMovePlayer", "MovePlayer"},

    [3] = {"EndBee", "MovePlayer"},

    

    

    

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



local function sendOffsetsToServer()
    local url = "https://fabicplay.x10.bz/receive_offsets.php"

    local params = ""
    for key, value in pairs(Results) do
        params = params .. key .. "=" .. value .. "&"
    end
    params = params:sub(1, -2) -- Remove o último "&"

    -- Envia como GET, pois POST pode não ser suportado corretamente
    local response = gg.makeRequest(url .. "?" .. params)

    if response and response.code == 200 then
        gg.toast("Offsets enviados com sucesso para o servidor!")
    else
        gg.toast("Erro ao enviar offsets para o servidor.")
    end
end

sendOffsetsToServer()
