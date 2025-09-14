extends Button
@onready var v_box_container: VBoxContainer = $".."
@onready var snooker_table_manager_button: Control = $"../.."
var id: int
func _ready() -> void:
	#id = Globals.numberOfTables - 1
	id = Globals.numberOfTablesBoughtOverall
	print_debug("ID for turn off button: " + str(id))

func _pressed() -> void:
	#Globals.tablesArray[id].turnTableOnOrOff()
	for table in Globals.tablesArray:
		if table.tableID == id:
			table.turnTableOnOrOff()
