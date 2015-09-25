function crearInstrucciones()

	local scene = director:createScene()
	scene.name = "instrucciones" 

	local background = director:createSprite({
		x = 0,
		y = 0,
		name = "background",
		source = "sprites/instrucciones/bg.png"
		})

	local texto = director:createLabel({
		x=100,
		y=300,
		font = "fonts/Default.fnt",
		text = "Lolo, haz caido en un planeta desconocido. \nEntra a la cueva para conseguir minerales que te daran comida\n y mejora to oxigeno para poder estar mas tiempo en la cueva\n Ataca a tus enemigos de frente y no dejes que ataquen por atrás"
		})
  
	return scene	
end