function crearInstrucciones()

	local scene = director:createScene()
	scene.name = "instrucciones" 

	local background = director:createSprite({
		x = 0,
		y = 0,
		name = "background",
		source = "sprites/about/bg.png"
		})
  
	return scene	
end