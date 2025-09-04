extends Button
@export_enum("Bad", "Good", "Pro") var tableToBuy: String = "Pro"

func _pressed() -> void:
	var parent = get_parent()
	parent.buyTable(tableToBuy)
