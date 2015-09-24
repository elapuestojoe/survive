function crearCueva()


	physics:resume()

	local scene = director:createScene()
	scene.name = "cueva"

	function scene:setUp(event)

		--El tiempo que durara la partida
		local segundosOxigeno = getSegundosOxigeno()

		local background=director:createSprite({
			x=0,
			y=0,
			name="background",
			source="sprites/cueva/bg.png"
			})

		local piso=director:createSprite({
			x=0,
			y=0,
			name="background",
			source="sprites/cueva/piso.png"
			})

		physics:addNode(piso, {type="static", restitution=0.3, friction=0}) --restitution es para el rebote

		local muro = director:createSprite({
			x=0,
			y=0,
			name = "muro",
			source = "sprites/cueva/wall.png"
			})
		physics:addNode(muro, {type="static", restitution=0, friction=0})

		local muroRight = director:createSprite({
			x=director.displayWidth-128,
			y=0,
			name = "muroRight",
			source = "sprites/cueva/wall.png"
			})
		physics:addNode(muroRight, {type="static", restitution=0, friction=0})

		--[[
		local alien=director:createSprite({
			x=100,
			y=400,
			name="background",
			source="sprites/cueva/alien.png",
			velocidad=200
			})
		]]--

		local atlasLolo = director:createAtlas({
			width = 75,
			height = 127,
			numFrames = 4,
			textureName = "sprites/cueva/lolo.png",
			})
		local animacionLolo = director:createAnimation({
			start = 1,
			count = 4,
			atlas = atlasLolo,
			delay = 1/10
			})

		local alien = director:createSprite({
			x=director.displayCenterX-160,
			y=director.displayCenterY,
			name = "fondoBotones",
			xAnchor=0.5,
			yAnchor=0.5,
			source = animacionLolo,
			velocidad=200
			})

		physics:addNode(alien, {restitution=0.1})

		--Agrega controles
		local leftControl = director:createSprite({
			x=50,
			y=10,
			name = "leftControl",
			source = "sprites/cueva/left.png",
			velocidad=-200
			})

		local rightControl = director:createSprite({
			x=leftControl.x+100,
			y=leftControl.y,
			name = "rightControl",
			source = "sprites/cueva/right.png",
			velocidad=200
			})

		local upControl = director:createSprite({
			x=director.displayWidth-100,
			y=leftControl.y,
			name = "upControl",
			source = "sprites/cueva/up.png"
			})

		function controlTouched(event)
			if event.phase=="began" then


				if alien.velocidad+event.target.velocidad==0 then 

					alien.xFlip = not alien.xFlip
					print("cambio")
					local x,y = alien.physics:getLinearVelocity()

					alien.physics:setLinearVelocity(0,y)

					alien.velocidad=event.target.velocidad
				end
			end
		end

		--Funcion saltar
		function saltar(event)
			if event.phase=="began" then

				local x,y = alien.physics:getLinearVelocity() --Obtiene velocidad en x,y de alien
				
				if(y<10 and alien.y-piso.y<alien.h+piso.h) then --Si la velocidad en y es 0 entonces puede saltar (no salta dos veces)

					alien.physics:setLinearVelocity(0,400)
				end

			end
		end

		leftControl:addEventListener("touch", controlTouched)
		rightControl:addEventListener("touch", controlTouched)
		upControl:addEventListener("touch", saltar)


		function updateFunction()
			
			--alien.physics:applyLinearImpulseToCenter(alien.velocidad,0)

			local x,y = alien.physics:getLinearVelocity()

			alien.physics:setLinearVelocity(alien.velocidad,y)

			alien.physics:setAngularVelocity(0)

		end

		system:addEventListener("update", updateFunction)


		--Cosas del juego

		--Manejo de tiempo
		local segundosOxigenoLabel = director:createLabel({
			x=director.displayCenterX,
			y=director.displayHeight-200,
			font = "fonts/Default.fnt",
			text = "Segundos oxígeno: "..segundosOxigeno
			})

		--Nave que crea enemigos
		scene.nave = director:createSprite({
			x=100,
			y=director.displayHeight-100,
			xAnchor=0.5,
			yAnchor=0.5,
			name = "nave",
			source = "sprites/menu/Gemas2.png"
			})

		function crearEnemigo()

			print("enemigo")
			print(scene.nave.x)

			local enemigo = director:createSprite({
				x=scene.nave.x,
				y=400,
				name = "enemigo",
				source = "sprites/cueva/corazon.png"
				})

			physics:addNode(enemigo, {debugDraw=true})

		end

		------Function timer, se llama cada segundo
		function timerNivel()

			segundosOxigeno = segundosOxigeno-1

			if segundosOxigeno<0 then

				--Prueba de aumentar segundos oxígeno al ganar
				aumentarSegundosOxigeno(2)
				switchToScene("game")

			else
				segundosOxigenoLabel.text = "Segundos oxígeno: ".. segundosOxigeno

				--Crear enemigo
				if math.random(1,5)==3 then 
					--crearEnemigo()
				end
			end

		end
		--------------------

		--Le decimos a la escena que llame timer una vez por segundo
		scene.timer = system:addTimer(timerNivel, 1, segundosOxigeno+1)


		function animarNave(target)
			tween:to(scene.nave,{
				x=math.random(100, director.displayWidth-100),
				time=math.random(2,5),
				onComplete=animarNave
				})
		end

		--Cosas de la vida


		local vida = director:createSprite({
			x=120,
			y=director.displayHeight-50,
			xAnchor=0.5,
			yAnchor=0.5,
			name = "vida",
			source = "sprites/cueva/corazon.png"

		})

		scene.cuadro = director:createRectangle( {
			x=vida.x + 60, 
			y=vida.y+ 5,
			xAnchor=0,
			yAnchor=0.5, -- x, y now specify the centre
			w=500, 
			h=50,
			strokeWidth=2, 
			strokeColor=color.pink, 
			strokeAlpha=0.75,
			color=color.red, alpha=0.5,
			} )

		function bajarVida(vida)
			if scene.cuadro.w-vida>0 then
				scene.cuadro.w = scene.cuadro.w - vida
			else

				print("perdiste")
			end
		end

		animarNave(scene.nave)
	end

	scene:addEventListener({"setUp"}, scene)


	return scene	
end