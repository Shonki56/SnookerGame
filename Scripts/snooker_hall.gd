extends Node2D
@onready var tables: Node = $Tables
@onready var management_ui: Control = $ManagementUI

var snookerTable = preload("res://Scenes/SnookerHall/snooker_table.tscn")

func _ready():
	createTables()
	Globals.boughtNewTable.connect(addNewTableToSnookerHall)
		
func createTables():
	for i in range(Globals.numberOfTables):
		createTable(Globals.tablePositionsArray[i])

func createTable(positionChild):
	var newTable = snookerTable.instantiate()
	newTable.position =	positionChild
	tables.add_child(newTable)
	Globals.tablesArray.append(newTable)
	
func addNewTableToSnookerHall():
	Globals.tableBeingBought.position = Globals.tablePositionsArray[Globals.numberOfTables - 1]
	tables.add_child(Globals.tableBeingBought)
	Globals.tableBeingBought = null
	
