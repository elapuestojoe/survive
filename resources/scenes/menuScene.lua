function crearMenu()

	local scene = director:createScene()
	scene.name = "menu" 

	local background = director:createSprite({
		x = 0,
		y = 0,
		name = "background",
		source = "sprites/menu/bg.png"
		})

	local btnNewGame = director:createSprite({
		x=director.displayCenterX,
		y=director.displayCenterY+300,
		xAnchor=0.5,
		yAnchor=0.5,
		name = "newGame",
		source = "sprites/menu/newGame.png"
		})

	local btnPlay = director:createSprite({
		x=director.displayCenterX,
		y=director.displayCenterY+150,
		xAnchor=0.5,
		yAnchor=0.5,
		name = "game",
		source = "sprites/menu/playBtn.png"
		})

	local btnAbout = director:createSprite({
		x=director.displayCenterX,
		y=director.displayCenterY,
		xAnchor=0.5,
		yAnchor=0.5,
		name = "about",
		source = "sprites/menu/btn.png"
		})


	function cambiarEscena(event)

		if event.phase == "began" then 

			switchToScene(event.target.name)

		end

	end

	btnAbout:addEventListener("touch", cambiarEscena)
	btnPlay:addEventListener("touch", cambiarEscena)
	btnNewGame:addEventListener("touch", cambiarEscena)
  
	return scene	
end