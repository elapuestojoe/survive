function crearCueva()


	physics:resume()

	local scene = director:createScene()
	scene.name = "cueva"
	scene.listaEnemigos = {}
	scene.listaCool = {}
	scene.cosasCoolObtenidas = 0

	function scene:setUp(event)

		--El tiempo que durara la partida
		local segundosOxigeno = getSegundosOxigeno()

		local background=director:createSprite({
			x=0,
			y=0,
			name="background",
			source="sprites/cueva/bg.png"
			})

		local ui = director:createSprite({
			x=0,
			y=-20,
			zOrder=2,
			name = "ui",
			source = "sprites/cueva/ui.png"
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
			y=128,
			name = "muro",
			source = "sprites/cueva/wall.png"
			})
		physics:addNode(muro, {type="static", restitution=0, friction=0})

		local muroRight = director:createSprite({
			x=director.displayWidth-128,
			y=128,
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
			velocidad=330
			})

		physics:addNode(alien, {restitution=0.1})


		local atlasEspada = director:createAtlas({
			width = 85,
			height = 48,
			numFrames = 4,
			textureName = "sprites/cueva/espada.png",
			})
		local animacionEspada = director:createAnimation({
			start = 1,
			count = 4,
			atlas = atlasEspada,
			delay = 1/10
			})

		local espada = director:createSprite({
			x=80,
			y=50,
			name = "espada",
			xAnchor=0.5,
			yAnchor=0.5,
			source = animacionEspada
			})

		alien:addChild(espada)
		alien.espada = espada
		--Agrega controles
		local leftControl = director:createSprite({
			x=50,
			y=0,
			zOrder=5,
			xScale=1.5,
			yScale=1.5,
			name = "leftControl",
			source = "sprites/cueva/left.png",
			velocidad=-330
			})

		local rightControl = director:createSprite({
			x=leftControl.x+200,
			y=leftControl.y,
			zOrder=5,
			name = "rightControl",
			xScale=1.5,
			yScale=1.5,
			source = "sprites/cueva/right.png",
			velocidad=330
			})

		local upControl = director:createSprite({
			x=director.displayWidth-200,
			zOrder=5,
			y=leftControl.y,
			name = "upControl",
			xScale=1.5,
			yScale=1.5,
			source = "sprites/cueva/up.png"
			})

		function controlTouched(event)
			if event.phase=="began" then


				if alien.velocidad+event.target.velocidad==0 then 

					alien.xFlip = not alien.xFlip
					alien.espada.xFlip = not alien.espada.xFlip

					if alien.espada.xFlip then 
						--alien.espada.x = 50
						alien.espada.xAnchor=0
						alien.espada.x=-50
					else 
						alien.espada.x = 80
						alien.espada.xAnchor=.5
					end
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
			x=director.displayCenterX-500,
			y=director.displayHeight-70,
			font = "fonts/Default.fnt",
			text = "Segundos oxígeno: "..segundosOxigeno
			})

		scene.gemasLabel = director:createLabel({
			x=director.displayCenterX-500,
			y=director.displayHeight-120,
			font = "fonts/Default.fnt",
			text = "Minerales Obtenidos: "..scene.cosasCoolObtenidas
			})

		--Nave que crea enemigos
		scene.nave = director:createSprite({
			x=director.displayCenterX,
			y=director.displayHeight-180,
			xAnchor=0.5,
			yAnchor=0.5,
			name = "nave",
			source = "sprites/cueva/nave.png"
			})

		function crearEnemigo()

			print("enemigo")
			print(scene.nave.x)

			local numEnemigo = math.random(1,3)
			local width = 109
			local height = 105
			local numFrames = 4

			local atlasEnemigo = director:createAtlas({
				width = width,
				height = height,
				numFrames = numFrames,
				textureName = "sprites/cueva/enemigo"..numEnemigo..".png",
				})
			local animacionEnemigo = director:createAnimation({
				start = 1,
				count = 4,
				atlas = atlasEnemigo,
				delay = 1/3
				})

			local enemigo = director:createSprite({
				x=scene.nave.x,
				y=scene.nave.y,
				name = "fondoBotones",
				xAnchor=0.5,
				yAnchor=0.5,
				source = animacionEnemigo
				})

			function animarEnemigo(target)
				tween:to(enemigo,{
					x=math.random(110,director.displayWidth-70),
					time=math.random(1,4),
					onComplete=animarEnemigo
					})
			end
			tween:to(enemigo,{
				y=175,
				time=0.5,
				onComplete=animarEnemigo
				})

			table.insert(scene.listaEnemigos, enemigo)

			local luz = director:createSprite({
				x=80,
				y=15,
				xAnchor=0.5,
				yAnchor=1,
				xScale=0.8,
				yScale=0.8,
				alpha=0.5,
				name = "luz",
				source = "sprites/cueva/luz.png"
				})
			tween:to(luz,{
				alpha=0,
				time=0.5,
				onComplete=function(target) target =target:removeFromParent() end 
				})
			scene.nave:addChild(luz)
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

			end

		end
		--------------------
		function timerEnemigos()
			if math.random(1,100)<70 then crearEnemigo() end 
		end
		--Le decimos a la escena que llame timer una vez por segundo
		scene.timer = system:addTimer(timerNivel, 1, 0)
		scene.timerEnemigo = system:addTimer(timerEnemigos,0.4,0)


		function animarNave(target)
			tween:to(scene.nave,{
				x=math.random(100, director.displayWidth-100),
				time=math.random(1,3),
				onComplete=animarNave
				})
		end

		--Cosas de la vida


		local vida = director:createSprite({
			x=director.displayCenterX-50,
			y=director.displayHeight-80,
			xAnchor=0.5,
			yAnchor=0.5,
			xScale=0.8,
			yScale=0.8,
			name = "vida",
			source = "sprites/cueva/corazon.png"

		})

		scene.cuadro = director:createRectangle( {
			x=vida.x + 90, 
			y=vida.y+ 5,
			xAnchor=0,
			yAnchor=0.5, -- x, y now specify the centre
			w=500, 
			h=30,
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

		function updateScene(event)
			--print("update")
			local xMarciano = alien.x
			local yMarciano = alien.y 

			local xEspada = alien.espada.x+alien.x
			local yEspada = alien.espada.y+alien.y - 60



			local i=1
			while scene.listaEnemigos[i] do 
				local enemigo = scene.listaEnemigos[i]

				if math.abs(enemigo.x-xMarciano) < 30 and math.abs(enemigo.y-yMarciano)<30 then

					table.remove(scene.listaEnemigos, i)
					enemigo = enemigo:removeFromParent()

					bajarVida(20)

				elseif math.abs(enemigo.x-xEspada) < 50 and math.abs(enemigo.y-yEspada) < 50 then 

					if math.random(1,40) == 5 then 

						--Spawnear cosas cool

						local cosaCool = director:createSprite({
							x=enemigo.x,
							y=enemigo.y,
							xAnchor=0.5,
							yAnchor=0.5,
							name = "cosaCool",
							source = "sprites/cueva/cosaCool.png"
							})
						cosaCool.rotation = math.random(-30,30)

						table.insert(scene.listaCool, cosaCool)
					end

					table.remove(scene.listaEnemigos, i)
					enemigo = enemigo:removeFromParent()



				end

				i=i+1
			end

			local p = 1
			while scene.listaCool[p] do 

				local cosaCool = scene.listaCool[p]
				local personajeX = alien.x
				local personajeY = alien.y

				if math.abs(personajeX-cosaCool.x) < 40 and math.abs(personajeY-cosaCool.y) < 40 then

					--SUMAR COSAS COOL
					table.remove(scene.listaCool, p)
					cosaCool = cosaCool:removeFromParent()

					scene.cosasCoolObtenidas = scene.cosasCoolObtenidas+1
					print(scene.cosasCoolObtenidas)
					scene.gemasLabel.text = "Minerales Obtenidos: ".. scene.cosasCoolObtenidas
				end

				p=p+1
			end

		end

		system:addEventListener("update", updateScene)
	end

	function scene:tearDown(event)

		scene.timer:cancel()
		scene.timerEnemigo:cancel()
		system:removeEventListener("update", updateScene)
		system:removeEventListener("update", updateFunction)
	end

	scene:addEventListener({"setUp", "tearDown"}, scene)


	return scene	
end