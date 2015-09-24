function crearGame()

	local scene = director:createScene()
	scene.name = "game"
  block = true
  local objetoSeleccionado = nil
  edicion = true
  
	local background=director:createSprite({
		x=0,
		y=0,
		name="background",
		source="sprites/play/bg.png"
  })

	local barra = director:createSprite({
		x=director.displayCenterX,
		y=-200,
		xAnchor=0.5,
		yAnchor=0.5,
		source = "sprites/play/barra.png",
    yScale = 0.6
  })

	local corazon = director:createSprite({
		x=1000,
		y=680,
		xAnchor=0.5,
		yAnchor=0.5,
		source = "sprites/play/corazon.png",
    xScale = 0.2,
    yScale = 0.2
  })

	local construir = director:createSprite({
		x=100,
		y=100,
		xAnchor=0.5,
		yAnchor=0.5,
		source = "sprites/play/flecha.png",
    xScale = 0.2,
    yScale = 0.2
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
		x=100,
		y=650,
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

  local upgrade = director:createSprite({
    x=-200,
    y=director.displayCenterY,
    xScale = 0.5,
    yScale = 0.5,
    xAnchor=0.5,
		yAnchor=0.5,
    source = "sprites/play/upgrade.png"
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
    x=400,
    y=-130,
    xScale = 2,
    yScale = 2,
    xAnchor=0.5,
		yAnchor=0.5,
    block=false,
    fuera = false,
    nombre = "edificio",
    source = "sprites/play/edificio.png"
 })


local lab = director:createSprite({
    color = color.black,
    x=700,
    y=-130,
    xScale = 0.3,
    yScale = 0.3,
    xAnchor=0.5,
		yAnchor=0.5,
    block=false,
    fuera = false,
    available = false,
    nombre = "lab",
    source = "sprites/play/lab.png"
 })

sprites={mono,lab}
function mono:touch(event)
  if not objetoSeleccionado then
    objetoSeleccionado = event.target
  end
  if objetoSeleccionado.block == false then
      if event.phase == "began" then
          u = objetoSeleccionado.x
          v = objetoSeleccionado.y
          objetoSeleccionado.x = event.x
          objetoSeleccionado.y = event.y
          
      elseif event.phase == "ended" then
          for a, b in pairs(sprites) do
            if b == objetoSeleccionado then
            
            else
           
              if objetoSeleccionado.x+200 > b.x and objetoSeleccionado.x-120 < b.x and objetoSeleccionado.y+200 > b.y and objetoSeleccionado.y-200 < b.y then
                objetoSeleccionado.x = u
                objetoSeleccionado.y = v
              else
              end
            end
          end
          
          objetoSeleccionado.fuera = true
          objetoSeleccionado = nil

      elseif event.phase == "moved" then
        local dx = event.x -   objetoSeleccionado.x
        local dy = event.y -   objetoSeleccionado.y
         objetoSeleccionado.x =   objetoSeleccionado.x + dx
          objetoSeleccionado.y =   objetoSeleccionado.y + dy
          objetoSeleccionado.x = event.x
          objetoSeleccionado.y = event.y
      end
      end
end

 function stop(event)
   if event.phase == "began" then
      for a, b in pairs(sprites) do
        b.block = true
      end
      done.x = 1500
      editar.x = 1000
      edicion = false
    end
 end
 
 function edit(event)
   if event.phase == "began" then
    for a, b in pairs(sprites) do
        b.block = false
      end      done.x = 1000
      editar.x = 1500
      edicion = true
    end
end

 function up(event)
   if event.phase == "began" then
     if edicion == false then
      upgrade.x = event.target.x;
    end  
  end
end



function menu(event)
  if event.phase == "began" then
    if not construir.yFlip then 
      barra.y = 100
      if lab.fuera == false then
        lab.y = 130
      end
      if mono.fuera == false then
        mono.y = 130
      end
      construir.yFlip = true
    else
      construir.yFlip = false
        barra.y = -200
      if lab.fuera  == false then
        lab.y = -130
       end
      if mono.fuera  == false then
        mono.y = -130
      end
    end
  end
end


mono:addEventListener("touch", mono)
done:addEventListener("touch",stop)
editar:addEventListener("touch",edit)
mono:addEventListener("touch",up)
--upgrade:addEventListener("touch",mejorar)

if lab.available == true then
  lab:addEventListener("touch", mono)
end

construir:addEventListener("touch",menu)

	function cambiarEscena(event)

		if event.phase == "began" then 

			switchToScene(event.target.name)

		end

	end

	cuevaBtn:addEventListener("touch", cambiarEscena)


	return scene	
end