extends CanvasLayer
@onready var timer: Timer = $Timer
@onready var label: Label = $ColorRect/Label
@onready var color_rect = $ColorRect

func _ready() -> void:
	timer.timeout.connect(fadeAwayPopUp)
	Globals.showPopUp.connect(changeTextAndShowPopUpNew)
	color_rect.modulate.a = 0
	
func _on_timer_timeout():
	visible = false
	
func changeTextAndShowPopUp():
	visible = true
	label.text = Globals.currentPopUpMessage
	timer.start()

func fadeAwayPopUp():
	var tween = create_tween()
	tween.tween_property(color_rect, "modulate:a", 0.0, 0.5)
	
func changeTextAndShowPopUpNew():
	var tween = create_tween()
	tween.tween_property(color_rect, "modulate:a", 1.0, 0.5)
	label.text = Globals.currentPopUpMessage
	timer.start()
