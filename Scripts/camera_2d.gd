extends Camera2D

const CAMERA_MOVEMENT_SPEED := 600

func _process(delta: float) -> void: 
	if Globals.isManagementPanelVisible == false:
		if Input.is_action_pressed("MoveLeft"):
			position.x -= CAMERA_MOVEMENT_SPEED * delta
		if Input.is_action_pressed("MoveRight"):
			position.x += CAMERA_MOVEMENT_SPEED * delta
		if Input.is_action_pressed("MoveDown"):
			position.y += CAMERA_MOVEMENT_SPEED * delta
		if Input.is_action_pressed("MoveUp"):
			position.y -= CAMERA_MOVEMENT_SPEED * delta
		Globals.cameraPosition = position
