extends Control
@onready var assign_table: Button = $VBoxContainer/AssignTable

func _ready() -> void:
	assign_table.pressed.connect(setUpTableForCustomer)
	
func setUpTableForCustomer():
	for i in range(Globals.tablesArray.size()):
		if Globals.tablesArray[i].isTableBeingUsed == false:
			Globals.tablesArray[i].isTableBeingUsed = true
			Globals.tablesArray[i].turnTableOnOrOff()
			return
	# Add something here when all the tables are being used
