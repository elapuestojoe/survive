function crearGame()

	local scene = director:createScene()
	scene.name = "game"
  block = true
  local objetoSeleccionado = nil
  edicion = true
  local joyasRecurso = 100
  local precioCasa = 50
  local precioComida = 25
  
	local background=director:createSprite({
		x=0,
		y=0,
		name="background",
		source="sprites/play/bg.png"
  })

local background2=director:createSprite({
		x=0,
		y=0,
		name="background2",
		source="sprites/play/Ui.png"
  })

-- Animaciones
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
	
	local barra = director:createSprite({
		x=-500,
		y=director.displayCenterY,
    xAnchor = 0.5,
    yAnchor = 0.5,
		name = "fondoBotones",
		source = animacionFondoBotones,
		xScale=1,
		yScale=1
  })

	local atlasComida = director:createAtlas({
		width = 68,
		height = 109.5,
		numFrames = 4,
		textureName = "sprites/play/maquina.png"
		})

	local animacionComida = director:createAnimation({
		start=1,
		count=4,
		atlas = atlasComida,
		delay = 1/2
		})

	local comida = director:createSprite({
		x=-350,
		y=300,
		name = "comida",
		source = animacionComida,
    block=false,
    fuera = false,
    precio = 25;
    available = false
  })

	local atlasOxigeno = director:createAtlas({
		width = 126.5,
		height = 92.5,
		numFrames = 4,
		textureName = "sprites/play/oxigeno.png"
		})

	local animacionOxigeno = director:createAnimation({
		start=1,
		count=4,
		atlas = atlasOxigeno,
		delay = 1/2
		})

	local oxigeno = director:createSprite({
		x=-500,
		y=300,
		name = "oxigeno",
		source = animacionOxigeno,
    block=false,
    fuera=false,
    precio = 25;
    available=false
  })

	local atlasNave = director:createAtlas({
		width = 205.5,
		height = 114.5,
		numFrames = 4,
		textureName = "sprites/play/nave.png"
		})

	local animacionNave = director:createAnimation({
		start=1,
		count=4,
		atlas = atlasNave,
		delay = 1/9
		})

	local nave = director:createSprite({
		x=205.5,
		y=114.5,
		name = "nave",
		source = animacionNave,
    block=false,
    fuera=false,
    available=false
  })

-- Imagenes

	local construir = director:createSprite({
		x=100,
		y=director.displayCenterY,
		xAnchor=0.5,
		yAnchor=0.5,
		source = "sprites/play/flecha.png",
    xScale = -1,
    yScale = 1
  })

	local cuevaBtn = director:createSprite({
		x=director.displayWidth-200,
		y=director.displayHeight-200,
		xAnchor=0.5,
		yAnchor=0.5,
		name = "cueva",
		source = "sprites/play/cuevaBtn.png"
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
   --[[ 
  local mon = director:createSprite({
    x=director.displayCenterX,
    y=director.displayCenterY,
    xScale = 0.1,
    yScale = 0.1,
    xAnchor=0.5,
		yAnchor=0.5,
    source = "sprites/play/mono.png"
  })
--]]
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


local mejora = director:createSprite({
    x=400,
    y=-130,
    xScale = 2.5,
    yScale = 2.5,
    xAnchor=0.5,
		yAnchor=0.5,
    block=false,
    fuera = false,
    source = "sprites/play/mejorar2.png"
 })


sprites={oxigeno,mejora,comida,nave}

-- Textos

	local segundosOxigenoLabel = director:createLabel({
		x=100,
		y=650,
		font = "fonts/Default.fnt",
		text = "Segundos oxígeno: " .. getSegundosOxigeno()
  })

local joyas = director:createLabel({
		x=-370,
		y=470,
		font = "fonts/Default.fnt",
		text = "Joyas: " .. joyasRecurso
  })

local precioCasa = director:createLabel({
		x=-250,
		y=250,
		font = "fonts/Default.fnt",
		text = "Precio: " .. precioCasa
  })

local precioC = director:createLabel({
		x=-500,
		y=250,
		font = "fonts/Default.fnt",
		text = "Precio: " .. precioComida
  })

function onObjectTouch(event)
  if not objetoSeleccionado then
    objetoSeleccionado = event.target
  end
  if objetoSeleccionado.block == false then
      if event.phase == "began" then
        print(objetoSeleccionado.block)
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
              end
            end
          end
          
          objetoSeleccionado.fuera = true
          objetoSeleccionado = nil

      elseif event.phase == "moved" then
        local dx = event.x - objetoSeleccionado.x
        local dy = event.y - objetoSeleccionado.y
        objetoSeleccionado.x = objetoSeleccionado.x + dx
        objetoSeleccionado.y = objetoSeleccionado.y + dy
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
      end
      done.x = 1000
      editar.x = 1500
      edicion = true
    end
end

 function up(event)
   if event.phase == "began" then
     if edicion == false then
      upgrade.y = event.target.y - 150;
      upgrade.x = event.target.x
    end  
  end
end

function mejorar(event)
  if event.phase == "began" then
    mejora.x = oxigeno.x
    mejora.y = oxigeno.y
    --mono = nil
    upgrade.x = -300
  end
end

function menu(event)
  if event.phase == "began" then
    if not construir.xFlip then 
      if comida.fuera == false then
        tween:to(comida,{
          x=550,
        })
      end
 
      if oxigeno.fuera == false then
        tween:to(oxigeno,{
          x=250,
        })
      end
      tween:to(barra,{
				x=445,
      })
      tween:to(joyas,{
				x=370,
      })
      tween:to(precioCasa,{
				x=250,
      })
      tween:to(precioC,{
				x=500,
      })
      construir.xFlip = true

    else
      construir.xFlip = false
      if oxigeno.fuera  == false then
        tween:to(oxigeno,{
          x=-500,
         })
      end
      if comida.fuera == false then
        tween:to(comida,{
          x=-400,
         })
      end
      tween:to(barra,{
				x=-445,
      }) 
      tween:to(joyas,{
				x=-370,
      })
      tween:to(precioCasa,{
				x=-250,
      })
      tween:to(precioC,{
				x=-500,
      })
    end
  end
end


--mono:addEventListener("touch",mono)
--comida:addEventListener("touch",mono)
done:addEventListener("touch",stop)
editar:addEventListener("touch",edit)
oxigeno:addEventListener("touch",up)
upgrade:addEventListener("touch",mejorar)
--mejora:addEventListener("touch",mono)
--nave.add

for a,b in pairs(sprites) do
  b:addEventListener("touch",onObjectTouch)
end

--[[
if comida.available == true then
  comida:addEventListener("touch", mono)
end
--]]

construir:addEventListener("touch",menu)



	function cambiarEscena(event)

		if event.phase == "began" then 

			switchToScene(event.target.name)

		end

	end

	cuevaBtn:addEventListener("touch", cambiarEscena)


	return scene	
end