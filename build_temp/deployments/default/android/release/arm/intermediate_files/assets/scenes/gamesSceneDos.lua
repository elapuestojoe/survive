function crearGame()

	local scene = director:createScene()
	scene.name = "game"
  block = true
  local objetoSeleccionado = nil
  edicion = true
  local joyasRecurso = 100
  local precioCasa = 20
  local precioComida = 35
  local click = false
  
---- FONDO -----
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

-- Animaciones --
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
		alpha = 0,
    x=500,
		y=director.displayCenterY,
    xAnchor = 0.5,
    yAnchor = 0.5,
    touchable = false,
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
		x=-600,
		y=350,
    yAnchor = 0.5,
    xAnchor = 0.5,
    alpha = 0,
    touchable = false,
		source = animacionComida,
    block=false,
    name = "comida",
    fuera = false,
    precio = 35,
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
		x=-400,
		y=350,
    alpha = 0,
    touchable = false,
		name = "oxigeno",
		source = animacionOxigeno,
    block=false,
    fuera=false,
    holihola = false,
    precio = 20,
    yAnchor = 0.5,
    name = "oxigeno",
    xAnchor = 0.5,
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
		x=1000,
		y=director.displayCenterY,
		name = "nave",
		source = animacionNave,
    block=false,
    fuera=true,
    yAnchor = 0.5,
    xAnchor = 0.5,
    alpha = 1,
    touchable = false,
    available=false
  })

--- IMAGENES --

	local flecha = director:createSprite({
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

  local oxigeno1 = director:createSprite({
		x=-400,
		y=350,
    alpha = 0,
    touchable = false,
		name = "oxigeno",
		source = animacionOxigeno,
    block=false,
    fuera=false,
    precio = 20,
    yAnchor = 0.5,
    name = "oxigeno1",
    xAnchor = 0.5,
  })

  local oxigeno2 = director:createSprite({
		x=-400,
		y=350,
    alpha = 0,
    touchable = false,
		source = animacionOxigeno,
    block=false,
        holihola = false,
    fuera=false,
    precio = 20,
    yAnchor = 0.5,
    name = "oxigeno2",
    xAnchor = 0.5,
  })

  local oxigeno3 = director:createSprite({
		x=-400,
		y=350,
    alpha = 0,
    touchable = false,
		source = animacionOxigeno,
    block=false,
    fuera=false,
    precio = 20,
    yAnchor = 0.5,
    name = "oxigeno3",
    xAnchor = 0.5,
  })

  local oxigeno4 = director:createSprite({
		x=-400,
		y=350,
    alpha = 0,
    touchable = false,
		source = animacionOxigeno,
    block=false,
    fuera=false,
    precio = 20,
    yAnchor = 0.5,
    name = "oxigeno4",
    xAnchor = 0.5,
  })

  local oxigeno5 = director:createSprite({
		x=-400,
		y=350,
    alpha = 0,
    touchable = false,
		name = "oxigeno5",
		source = animacionOxigeno,
    block=false,
    fuera=false,
    precio = 20,
    yAnchor = 0.5,
    xAnchor = 0.5,
  })

	local comida1 = director:createSprite({
		x=-600,
		y=350,
    yAnchor = 0.5,
    xAnchor = 0.5,
    alpha = 0,
    touchable = false,
		source = animacionComida,
    block=false,
    name = "comida1",
    fuera = false,
    precio = 35,
    available = false
  })
	local comida2 = director:createSprite({
		x=-600,
		y=350,
    yAnchor = 0.5,
    xAnchor = 0.5,
    alpha = 0,
    touchable = false,
		source = animacionComida,
    block=false,
    name = "comida2",
    fuera = false,
    precio = 35,
  })

	local comida3= director:createSprite({
		x=-600,
		y=350,
    yAnchor = 0.5,
    xAnchor = 0.5,
    alpha = 0,
    touchable = false,
		source = animacionComida,
    block=false,
    name = "comida3",
    fuera = false,
    precio = 35,
  })

	local comida4 = director:createSprite({
		x=-600,
		y=350,
    yAnchor = 0.5,
    xAnchor = 0.5,
    alpha = 0,
    touchable = false,
		source = animacionComida,
    block=false,
    name = "comida4",
    fuera = false,
    precio = 35,
  })

	local comida5 = director:createSprite({
		x=-600,
		y=350,
    yAnchor = 0.5,
    xAnchor = 0.5,
    alpha = 0,
    touchable = false,
		source = animacionComida,
    block=false,
    name = "comida5",
    fuera = false,
    precio = 35,
  })

-- Textos


  local segundosOxigenoLabel = director:createLabel({
		x=100,
		y=650,
		font = "fonts/Default.fnt",
		text = "Segundos oxígeno: " .. getSegundosOxigeno()
  })


  local joyas = director:createLabel({
		x=420,
		y=470,
    alpha = 0,
		font = "fonts/Default.fnt",
		text = "Joyas: " .. joyasRecurso
  })

  local precioCasa = director:createLabel({
		x=300,
		y=250,
    alpha = 0,
		font = "fonts/Default.fnt",
		text = "Precio: " .. precioCasa
  })

  local precioC = director:createLabel({
		x=550,
		y=250,
    alpha = 0,
		font = "fonts/Default.fnt",
		text = "Precio: " .. precioComida
  })

--- LISTAS ---

  local sprites={oxigeno,comida,nave,oxigeno1,oxigeno2,oxigeno3,oxigeno4,oxigeno5,comida1,comida2,comida3,comida4,comida5}
  local sprites1={oxigeno,comida,oxigeno1,oxigeno2,oxigeno3,oxigeno4,oxigeno5,comida1,comida2,comida3,comida4,comida5}
  local labels={joyas,precioCasa,precioC}
  
----- FUNCIONES---
  function onObjectTouch(event)
    if not objetoSeleccionado then
      objetoSeleccionado = event.target
    end
    
    if objetoSeleccionado.block == false then
       objetoSeleccionado.fuera = true
       
        if event.phase == "began" then
          barra.alpha = 0
          if objetoSeleccionado.name == "oxigeno" then
            oxigeno1.x = 400
            oxigeno1.alpha = 1
          end
          if objetoSeleccionado.name == "oxigeno1" then
            oxigeno2.x = 400
            oxigeno2.alpha = 1
          end
          if objetoSeleccionado.name == "oxigeno2" then
            oxigeno3.x = 400
            oxigeno3.alpha = 1
          end
          if objetoSeleccionado.name == "oxigeno3" then
            oxigeno4.x = 400
            oxigeno4.alpha = 1
          end
          if objetoSeleccionado.name == "oxigeno4" then
            oxigeno5.x = 400
            oxigeno5.alpha = 1
          end
          if objetoSeleccionado.name == "comida" then
            comida1.x = 600
            comida1.alpha = 1
          end
          if objetoSeleccionado.name == "comida1" then
            comida2.x = 600
            comida2.alpha = 1
          end
          if objetoSeleccionado.name == "comida2" then
            comida3.x = 600
            comida3.alpha = 1
          end
          if objetoSeleccionado.name == "comida3" then
            comida4.x = 600
            comida4.alpha = 1
          end
          if objetoSeleccionado.name == "comida5" then
            comida5.x = 600
            comida5.alpha = 1
          end
          flecha.xFlip = false

          for a,b in pairs(labels) do
            b.alpha = 0
          end
          for a,b in pairs(sprites1) do
            if b.fuera == false then
              b.alpha = 0
            end
          end
          u = objetoSeleccionado.x
          v = objetoSeleccionado.y
          objetoSeleccionado.x = event.x
          objetoSeleccionado.y = event.y
          
        elseif event.phase == "ended" then
          for a, b in pairs(sprites) do
            if b == objetoSeleccionado then
            
            elseif objetoSeleccionado.x+200 > b.x and objetoSeleccionado.x-120 < b.x and objetoSeleccionado.y+200 > b.y and objetoSeleccionado.y-200 < b.y then
              objetoSeleccionado.x = u
              objetoSeleccionado.y = v
            end
          end
          if click == true then
            joyasRecurso = joyasRecurso - objetoSeleccionado.precio
            joyas.text = "Joyas: " .. joyasRecurso
          end
          click = false
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
  
  function menu(event)
    if event.phase == "began" then
      click = true
      if not flecha.xFlip then 
        for a, b in pairs(sprites1) do
          if b.fuera == false then
            b.alpha = 1
            if b.name == "comida" or b.name == "comida1" or b.name == "comida2" or b.name == "comida3" or b.name == "comida3" or b.name == "comida4" or b.name == "comida5" then
              b.x = 600
            end
            if b.name == "oxigeno" or b.name == "oxigeno1" or b.name == "oxigeno2" or b.name == "oxigeno3" or b.name == "oxigeno3" or b.name == "oxigeno4" or b.name == "oxigeno5" then
              b.x = 400
            end
            if joyasRecurso >= b.precio then
              b.block=false
            else
              b.block =true
            end
          end
        end
        for a,b in pairs(labels) do
          b.alpha = 1
        end
        barra.alpha = 1
        flecha.xFlip = true
      else
              click = false
        flecha.xFlip = false
        for a, b in pairs(sprites1) do
          if b.fuera == false then
            b.alpha = 0
            b.touchable=false
          end
        end
        for a,b in pairs(labels) do
          b.alpha = 0
          b.x=-300
        end
        barra.alpha = 0
      end
    end
  end

  
  
  for a,b in pairs(sprites) do
      b:addEventListener("touch",onObjectTouch)
  end
  
  flecha:addEventListener("touch",menu)


function cambiarEscena(event)

		if event.phase == "began" then 

			switchToScene(event.target.name)

		end

	end

	cuevaBtn:addEventListener("touch", cambiarEscena)
  
  return scene
end