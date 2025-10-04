extends Control
@onready var tables_grid_container: GridContainer = $TablesGridContainer

var tableManagementPanel = preload("res://Scenes/UI/snooker_table_manager_button.tscn")

func createCustomTableManager():
	var newManager = tableManagementPanel.instantiate()
	tables_grid_container.add_child(newManager)
	newManager.tableNumberForButtonsID = Globals.numberOfTablesBoughtOverall
	Globals.buttonsArray.append(newManager)
	print_debug("New table being boughts ID: " + str(newManager.tableNumberForButtonsID))
