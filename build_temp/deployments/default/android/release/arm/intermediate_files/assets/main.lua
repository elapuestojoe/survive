-- Your app starts here!
print("This is my app!")

--If using [QUICK] DeferRenderingOnStart=1 in app.icf, you must call this
--when your first scene is ready to draw.
director:startRendering()

--function crearMenu
dofile("scenes/menuScene.lua")

--function crearAbout
dofile("scenes/aboutScene.lua")

--function crearGameScene
dofile("scenes/gameScene.lua")

--function crearCueva
dofile("scenes/cueva.lua")

--manejador de escenas

local gameScenes = {}

gameScenes.menu = function()

	local menu = crearMenu()
	director:setCurrentScene(nil)
	director:moveToScene(menu, {transitionType="fade", transitionTime=0.5})
end

gameScenes.game = function()
	
	local game = crearGame()
	director:setCurrentScene(nil)
	director:moveToScene(game, {transitionType="fade", transitionTime=0.5})

end

--Cueva
gameScenes.cueva = function()
	
	local cueva = crearCueva()
	director:setCurrentScene(nil)
	director:moveToScene(cueva, {transitionType="fade", transitionTime=0.5})
end

--About
gameScenes.about = function()

	local about = crearAbout()
	director:setCurrentScene(nil)
	director:moveToScene(about, {transitionType="fade", transitionTime=0.5})
end

function switchToScene(scene_name)	-- game14
	gameScenes[scene_name]()
end

--cambia al menú

--Lógica de botón back android

function hardKeyPressed(event)
	if event.phase == "released" then
		if event.keyCode == key.back then
			
			local scene = director:getCurrentScene()

			if scene.name == "game" then 

				switchToScene("menu")
				
			end

		end
	end
end
system:addEventListener("key", hardKeyPressed)

director:setCurrentScene(nil)
switchToScene("menu")