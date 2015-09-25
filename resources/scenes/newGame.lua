function crearNewGame()

	local scene = director:createScene()
	scene.name = "newGame"

	local background=director:createSprite({
		x=0,
		y=0,
		name="background",
		source="sprites/newGame/bg.png"
		})

	function crearBackground(num)
		local intro1 =director:createSprite({
			x=0,
			y=0,
			name="background",
			source="sprites/newGame/bg"..num..".png"
			})
	end

	print("NEW")
	local textoIntro = director:createLabel({
		x=500,
		y=500,
		font = "fonts/Default.fnt",
		text = "Nuevo juego morro loco"
		})

	local btnContinuar = director:createSprite({
		x=director.displayCenterX+440,
		y=40,
		xAnchor=0.5,
		yAnchor=0.5,
		num=0,
		zOrder=3,
		name = "btnContinuar",
		source = "sprites/newGame/continuar.png"
		})

	function continuar(event)
		if event.phase=="began" then 
			btnContinuar.num=btnContinuar.num+1

			if(btnContinuar.num<3)then 
				crearBackground(btnContinuar.num)
			else 
				nuevoJuego()
				switchToScene("game")
			end
		end
	end

	btnContinuar:addEventListener("touch", continuar)

	return scene	
end