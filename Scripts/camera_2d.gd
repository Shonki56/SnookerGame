extends Camera2D

func _process(delta: float) -> void: 
	if Globals.isManagementPanelVisible == false:
		if Input.is_action_pressed("MoveLeft"):
			position.x -= 600 * delta
		if Input.is_action_pressed("MoveRight"):
			position.x += 600 * delta
		if Input.is_action_pressed("MoveDown"):
			position.y += 600 * delta
		if Input.is_action_pressed("MoveUp"):
			position.y -= 600 * delta
		Globals.cameraPosition = position
