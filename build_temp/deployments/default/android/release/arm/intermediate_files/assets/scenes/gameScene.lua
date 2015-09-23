function crearGame()

	local scene = director:createScene()
	scene.name = "game"

	local background=director:createSprite({
		x=0,
		y=0,
		name="background",
		source="sprites/play/bg.png"
		})

	local cuevaBtn = director:createSprite({
		x=director.displayWidth-200,
		y=director.displayHeight-200,
		xAnchor=0.5,
		yAnchor=0.5,
		name = "cueva",
		source = "sprites/play/cuevaBtn.png"
		})

	function cambiarEscena(event)

		if event.phase == "began" then 

			switchToScene(event.target.name)

		end

	end

	cuevaBtn:addEventListener("touch", cambiarEscena)


	return scene	
end