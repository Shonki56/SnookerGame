extends CanvasLayer
@onready var assign_table: Button = $AssignTable

func _ready() -> void:
	assign_table.pressed.connect(setUpTableForCustomer)
	
func setUpTableForCustomer():
	get_parent().fadeAwayCustomer()
	visible = false
	for i in range(Globals.tablesArray.size()):
		if Globals.tablesArray[i].isTableBeingUsed == false:
			Globals.tablesArray[i].isTableBeingUsed = true
			Globals.tablesArray[i].turnTableOnOrOff()
			return
	# Add something here when all the tables are being used
