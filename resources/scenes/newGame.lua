function crearNewGame()

	local scene = director:createScene()
	scene.name = "newGame"

	local background=director:createSprite({
		x=0,
		y=0,
		name="background",
		source="sprites/newGame/bg.png"
		})

	local textoIntro = director:createLabel({
		x=500,
		y=500,
		font = "fonts/Default.fnt",
		text = "Nuevo juego morro loco"
		})

	local btnContinuar = director:createSprite({
		x=director.displayCenterX,
		y=300,
		xAnchor=0.5,
		yAnchor=0.5,
		name = "btnContinuar",
		source = "sprites/newGame/continuar.png"
		})

	function continuar(event)
		if event.phase=="began" then 
			
			nuevoJuego()
			switchToScene("game")
		end
	end

	btnContinuar:addEventListener("touch", continuar)

	return scene	
end