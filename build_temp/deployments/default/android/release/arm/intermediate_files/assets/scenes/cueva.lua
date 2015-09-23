function crearCueva()


	physics:resume()

	local scene = director:createScene()
	scene.name = "cueva"

	function scene:setUp(event)
		local background=director:createSprite({
			x=0,
			y=0,
			name="background",
			source="sprites/cueva/bg.png"
			})

		local piso=director:createSprite({
			x=0,
			y=100,
			name="background",
			source="sprites/cueva/piso.png"
			})

		physics:addNode(piso, {type="static", restitution=0.3}) --restitution es para el rebote

		local alien=director:createSprite({
			x=100,
			y=400,
			name="background",
			source="sprites/cueva/alien.png",
			velocidad=3
			})

		physics:addNode(alien, {restitution=0})

		--Agrega controles
		local leftControl = director:createSprite({
			x=100,
			y=100,
			name = "leftControl",
			source = "sprites/cueva/left.png",
			velocidad=-3
			})

		local rightControl = director:createSprite({
			x=leftControl.x+100,
			y=leftControl.y,
			name = "rightControl",
			source = "sprites/cueva/right.png",
			velocidad=3
			})

		local upControl = director:createSprite({
			x=director.displayWidth-100,
			y=leftControl.y,
			name = "upControl",
			source = "sprites/cueva/up.png"
			})

		function controlTouched(event)
			if event.phase=="began" then 
				alien.velocidad=event.target.velocidad
			end
		end

		--Funcion saltar
		function saltar(event)
			if event.phase=="began" then
				local x,y = alien.physics:getLinearVelocity() --Obtiene velocidad en x,y de alien
				
				if(y<10 and alien.y-piso.y<piso.h+20) then --Si la velocidad en y es 0 entonces puede saltar (no salta dos veces)

					alien.physics:setLinearVelocity(0,500)
				end

			end
		end

		leftControl:addEventListener("touch", controlTouched)
		rightControl:addEventListener("touch", controlTouched)
		upControl:addEventListener("touch", saltar)


		function updateFunction()
			alien.x = alien.x+alien.velocidad
		end

		system:addEventListener("update", updateFunction)

	end

	scene:addEventListener({"setUp"}, scene)


	return scene	
end