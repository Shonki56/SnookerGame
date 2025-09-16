extends Button
@onready var snooker_table_manager_button: Control = $"../.."

func _pressed() -> void:
	deleteTableAndButton()
			
func deleteTableAndButton():
	for i in range(Globals.tablesArray.size()):
		if Globals.tablesArray[i].tableID == snooker_table_manager_button.tableNumberForButtonsID:
			Globals.tablesArray[i].sellTable()
			Globals.deleteFromTablesArrayAndButtonsArray(i)
			snooker_table_manager_button.queue_free()
			Globals.updateTableLabelNumbers()
			break
