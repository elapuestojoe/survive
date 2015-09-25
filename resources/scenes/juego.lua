function crearGame()

	local scene = director:createScene()
	scene.name = "game"

	function scene:setUp(event)

		actualizarNewGame()

		local background=director:createSprite({
			x=0,
			y=0,
			name="background",
			source="sprites/play/bg.png"
  		})

  		local ui = director:createSprite({
  			x=0,
  			y=0,
  			name = "ui",
  			source = "sprites/play/ui.png"
  		})

  		local indicadorOxigeno = director:createSprite({
  			x=director.displayWidth-250,
  			y=director.displayHeight-45,
  			xAnchor=0.5,
  			yAnchor=0.5,
  			color = color.black,
  			name = "indicadorOxigeno",
  			source = "sprites/juego/oxigeno.png"
  			})

  		local oxigenoLabel = director:createLabel({
  			x=70,
  			y=5,
  			font = "fonts/Default.fnt",
  			text = "Oxígeno: " .. getSegundosOxigeno(),
  			color = color.black
  			})

  		indicadorOxigeno:addChild(oxigenoLabel)

  		local flechaCueva = director:createSprite({
  			x=190,
  			y=director.displayHeight-240,
  			xAnchor=0.5,
  			yAnchor=0.5,
  			name = "flechaCueva",
  			source = "sprites/juego/flecha.png",
  			rotation=45
  			})

  		local entrar = director:createLabel({
  			x=100,
  			y=0,
  			font = "fonts/Default.fnt",
  			text = "Entrar",
  			rotation=-45
  			})
  		flechaCueva:addChild(entrar)

  		function cambiarEscena(event)
			if event.phase == "began" then 
				switchToScene("cueva")
			end
		end

		flechaCueva:addEventListener("touch", cambiarEscena)
		entrar:addEventListener("touch", cambiarEscena)

		local indicadorGemas = director:createSprite({
			x=indicadorOxigeno.x-300,
			y=indicadorOxigeno.y,
			xAnchor=0.5,
			yAnchor=0.5,
			color = color.white,
			name = "indicadorGemas",
			source = "sprites/juego/indicadorGemas.png"
			})

		local gemasLabel = director:createLabel({
			x=70,
			y=5,
			font = "fonts/Default.fnt",
			text = "Gemas: ".. getGemas(),
			color = color.black
			})
		indicadorGemas:addChild(gemasLabel)

		local atlasLolo = director:createAtlas({
			width = 100,
			height = 100,
			numFrames = 4,
			textureName = "sprites/juego/lolo.png",
			})
		local animacionLolo = director:createAnimation({
			start = 1,
			count = 4,
			atlas = atlasLolo,
			delay = 1/3
			})

		local alien = director:createSprite({
			x=director.displayCenterX-160,
			y=350,
			name = "fondoBotones",
			xAnchor=0.5,
			yAnchor=0.5,
			source = animacionLolo,
			velocidad=330
			})

		local atlasLobot = director:createAtlas({
			width = 60,
			height = 60,
			numFrames = 4,
			textureName = "sprites/juego/lobot.png",
			})
		local animacionLobot = director:createAnimation({
			start = 1,
			count = 4,
			atlas = atlasLobot,
			delay = 1/3
			})

		local lobot = director:createSprite({
			x=director.displayCenterX+160,
			y=350,
			name = "fondoBotones",
			xAnchor=0.5,
			yAnchor=0.5,
			source = animacionLobot,
			velocidad=330
			})

		local atlasMaquina = director:createAtlas({
			width = 68,
			height = 109,
			numFrames = 4,
			textureName = "sprites/juego/maquina.png",
			})
		local animacionMaquina = director:createAnimation({
			start = 1,
			count = 4,
			atlas = atlasMaquina,
			delay = 1/5
			})

		local maquina = director:createSprite({
			x=director.displayCenterX+160,
			y=500,
			name = "fondoBotones",
			xAnchor=0.5,
			yAnchor=0.5,
			source = animacionMaquina,
			velocidad=330
			})

		local mejorar = director:createSprite({
			x=indicadorOxigeno.x-40,
			y=indicadorOxigeno.y-100,
			name = "mejorar",
			source = "sprites/juego/mejorar.png"
			})

		function mejorarOxi(event)
			if event.phase=="began" then 
				print("DJD")
				aumentarGemas(-20)
				aumentarSegundosOxigeno(20)

				gemasLabel.text = "Gemas: "..getGemas()
				oxigenoLabel.text = "Oxígeno: "..getSegundosOxigeno()

				if getGemas()<20 then 
					mejorar:removeEventListener("touch", mejorarOxi)
					mejorar.color=color.white
				end
			end

		end

		if getGemas()>=20 then 
			mejorar.color = color.green
			print("D")

			mejorar:addEventListener("touch", mejorarOxi)
		end

	end

	scene:addEventListener({"setUp"}, scene)
	return scene
end