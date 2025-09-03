extends Node2D
@onready var tables: Node = $Tables
@onready var management_ui: Control = $ManagementUI

var snookerTable = preload("res://Scenes/snooker_table.tscn")

func _ready():
	createTables()
	Globals.updateTablesAndTableButtons.connect(createNewTableBoughtFromShopNew)
		
func createTables():
	for i in range(Globals.numberOfTables):
		createTableNew(Globals.tablePositionsArray[i])

func createTableNew(positionChild):
	var newTable = snookerTable.instantiate()
	newTable.position =	positionChild
	tables.add_child(newTable)
	Globals.tablesArray.append(newTable)
	
func createNewTableBoughtFromShopNew():
	var newTable = snookerTable.instantiate()
	newTable.position = Globals.tablePositionsArray[Globals.numberOfTables]
	Globals.updateTablesArrayAndNumOfTables(newTable)
	tables.add_child(newTable)
