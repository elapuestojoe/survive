function crearAbout()

	local scene = director:createScene()
	scene.name = "about" 

	local background = director:createSprite({
		x = 0,
		y = 0,
		name = "background",
		source = "sprites/about/bg.png"
		})
  
	return scene	
end