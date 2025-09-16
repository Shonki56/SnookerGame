extends Node2D
@onready var area_2d: Area2D = $Area2D
@onready var customer_dialogue: Control = $CustomerDialogue

func _process(delta: float) -> void:
	position.x += 50 * delta


func _ready() -> void:
	area_2d.area_entered.connect(_on_area_entered)
	
func _on_area_entered():
	customer_dialogue.visible = true
	print("Customer entered something")
