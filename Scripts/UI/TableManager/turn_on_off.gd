extends Button
@onready var v_box_container: VBoxContainer = $".."
@onready var snooker_table_manager_button: Control = $"../.."
var id: int
func _ready() -> void:
	id = Globals.numberOfTables - 1
	print_debug("Button ID: " + str(id))

func _pressed() -> void:
	Globals.tablesArray[id].turnTableOnOrOff()
