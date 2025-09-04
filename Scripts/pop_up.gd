extends CanvasLayer
@onready var timer: Timer = $Timer
@onready var label: Label = $ColorRect/Label

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	Globals.showPopUp.connect(changeTextAndShowPopUp)
	
func _on_timer_timeout():
	visible = false
	
func changeTextAndShowPopUp():
	visible = true
	label.text = Globals.currentPopUpMessage
	timer.start()
