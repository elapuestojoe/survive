-----------------------------------------------------------------------
--[[
    Descripcion de salvarJuego.lua:
    Busca si existe un juego anterior, si no existe,
    crea uno nuevo.
]]--
------------------------------------------------------------------------

local data = {} --Arreglo de datos

local pathS = system:getFilePath("storage", "") --Lugar en sistema

local file = io.open(pathS .. "juego.txt", "r") --Nombre de archivo

if file == nil then
	print("No existe ningún juego previo")

	local pathS = system:getFilePath("storage", "")
  	local file = io.open(pathS .. "juego.txt", "w")
  	local data = {segundosOxigeno=20}

	local encoded = json.encode(data)
	file:write(encoded)
	file:close()
else
	dbg.print("Existe un juego previo, todo bien")
	local a = file:read("*a")
	local data = json.decode(a)
	--segundosOxigeno = data.segundosOxigeno
	file:close()
end

function getSegundosOxigeno()

	local pathS = system:getFilePath("storage", "")
  	local file = io.open(pathS .. "juego.txt", "r")
  	local archivo = file:read("*a")
  	local data = json.decode(archivo)
  	local segundosOxigeno = data.segundosOxigeno

  	file:close()
  	return segundosOxigeno

end

function  getData()
	local pathS = system:getFilePath("storage", "")
	local fileOpen = io.open(pathS .. "juego.txt", "r")
	local a = fileOpen:read("*a")
	local data = json.decode(a)
	fileOpen:close()
	return data
end


function aumentarSegundosOxigeno(tiempo)
	local data = getData()
	local pathS = system:getFilePath("storage", "")
	local file = io.open(pathS .. "juego.txt", "w")
	local archivo = file:read("*a")

  	data.segundosOxigeno=data.segundosOxigeno+2
  	local encoded = json.encode(data)
  	file:write(encoded)
  	file:close()
end