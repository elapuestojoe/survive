function crearMenu()

	local scene = director:createScene()
	scene.name = "menu" 

	--Animacion de fondo
	
	audio:playStream("sprites/menu/menu.mp3", true)
	
	local atlasFondo = director:createAtlas({
		width = 1280,
		height = 720,
		numFrames = 4,
		textureName = "sprites/menu/fondo.png"
		})

	local animacionFondo = director:createAnimation({
		start=1,
		count=4,
		atlas = atlasFondo,
		delay = 1/5
		})

	local fondo = director:createSprite({
		x=0,
		y=0,
		name = "fondo",
		source = animacionFondo
		})
	
	local logo = director:createSprite({
		x=director.displayCenterX,
		y=director.displayHeight-80,
		xAnchor=0.5,
		yAnchor=0.5,
		name = "logo",
		alpha=0.7,
		source = "sprites/menu/logo.png"
		})

	local atlasFondoBotones = director:createAtlas({
		width = 600,
		height = 405,
		numFrames = 14,
		textureName = "sprites/menu/fondoBtn.png",
		})
	local animacionFondoBotones = director:createAnimation({
		start = 1,
		count = 14,
		atlas = atlasFondoBotones,
		delay = 1/10
		})
	
	local fondoBotones = director:createSprite({
		x=director.displayCenterX-160,
		y=100,
		name = "fondoBotones",
		source = animacionFondoBotones,
		xScale=1.3,
		yScale=1.3
		})
	--
	local btnNewGame = director:createSprite({
		x=fondoBotones.x+400,
		y=fondoBotones.y+400,
		xAnchor=0.5,
		yAnchor=0.5,
		name = "newGame",
		source = "sprites/menu/newGame.png"
		})

	local btnPlay = director:createSprite({
		x=btnNewGame.x,
		y=btnNewGame.y-80,
		xAnchor=0.5,
		yAnchor=0.5,
		name = "game",
		source = "sprites/menu/playBtn.png"
		})

	local btnInstrucciones = director:createSprite({
		x=btnPlay.x,
		y=btnPlay.y-80,
		xAnchor=0.5,
		yAnchor=0.5,
		name = "instrucciones",
		source = "sprites/menu/instruccionesBtn.png"
		})

	local btnAcercaDe = director:createSprite({
		x=btnPlay.x,
		y=btnInstrucciones.y-80,
		xAnchor=0.5,
		yAnchor=0.5,
		name = "about",
		source = "sprites/menu/btnAcercaDe.png"
		})


	function cambiarEscena(event)

		if event.phase == "began" then 

			switchToScene(event.target.name)

		end

	end

	btnAcercaDe:addEventListener("touch", cambiarEscena)

	if getData().newGame==1 then 
		btnPlay.color = color.gray
	else 
		btnPlay:addEventListener("touch", cambiarEscena)
	end
	btnNewGame:addEventListener("touch", cambiarEscena)
	btnInstrucciones:addEventListener("touch", cambiarEscena)

  
	return scene	
end