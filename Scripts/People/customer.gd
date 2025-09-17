extends Node2D
@onready var area_2d: Area2D = $Area2D
@onready var customer_dialogue: CanvasLayer = $CustomerDialogue
@onready var customer_pop_up: Button = $CustomerPopUp

func _ready() -> void:
	customer_pop_up.pressed.connect(_on_customer_popup_pressed)
	
func _on_customer_popup_pressed():
	customer_dialogue.visible = true
	customer_pop_up.visible = false

var moving = true


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("Customer has entered something")
	customer_pop_up.visible = true
	moving = false
	
func fadeAwayCustomer():
	var tween = create_tween()
	tween.tween_property(self, "visible", false, 1)
	queue_free()
