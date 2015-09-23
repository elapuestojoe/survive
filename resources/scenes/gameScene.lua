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

	local segundosOxigenoLabel = director:createLabel({
		x=500,
		y=500,
		font = "fonts/Default.fnt",
		text = "Segundos oxígeno: " .. getSegundosOxigeno()
  })

  local done = director:createSprite({
		x = 1000,
		y = 400,
    xScale = 0.4,
    yScale = 0.4,
    xAnchor=0.5,
		yAnchor=0.5,
		source = "sprites/play/guardar.png"
  })
    
  local mon = director:createSprite({
    x=director.displayCenterX,
    y=director.displayCenterY,
    xScale = 0.1,
    yScale = 0.1,
    xAnchor=0.5,
		yAnchor=0.5,
    source = "sprites/play/mono.png"
  })

  local editar = director:createSprite({
		x = 1500,
		y = 400,
    xScale = 0.4,
    yScale = 0.4,
    xAnchor=0.5,
		yAnchor=0.5,
		source = "sprites/play/editar.png"
  })

local mono = director:createSprite({
    x=director.displayCenterX,
    y=120,
    xScale = 0.3,
    yScale = 0.3,
    xAnchor=0.5,
		yAnchor=0.5,
    source = "sprites/play/edificio.png"
 })

function mono:touch(event)
  if block == false then
    if event.phase == "began" then
        self.color = color.red
        mono.xLast = event.x
        mono.yLast = event.y
    elseif event.phase == "ended" then
        self.color = color.green
    elseif event.phase == "moved" then
        local dx = event.x - self.xLast
        local dy = event.y - self.yLast
        self.x = self.x + dx
        self.y = self.y + dy
        mono.xLast = event.x
        mono.yLast = event.y
     end
     end
end

 function stop(event)
   if event.phase == "began" then
      block = true
      done.x = 1500
      editar.x = 1000
    end
 end
 
 function edit(event)
   if event.phase == "began" then
      block=false
      done.x = 1000
      editar.x = 1500
    end
end

mono:addEventListener("touch", mono)
done:addEventListener("touch",stop)
editar:addEventListener("touch",edit)

	function cambiarEscena(event)

		if event.phase == "began" then 

			switchToScene(event.target.name)

		end

	end

	cuevaBtn:addEventListener("touch", cambiarEscena)


	return scene	
end