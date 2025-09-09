extends Control
@onready var pop_up: CanvasLayer = $PopUp

func _process(delta: float) -> void:
	if Globals.isManagementPanelVisible == true:
		pop_up.visible = false
	else:
		pop_up.visible = true
