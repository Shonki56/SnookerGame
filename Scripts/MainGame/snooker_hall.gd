extends Node2D
@onready var tables: Node = $Tables
@onready var management_ui: Control = $ManagementUI

var snookerTable = preload("res://Scenes/SnookerHall/snooker_table.tscn")

func _ready():
	Globals.boughtNewTable.connect(addNewTableToSnookerHall)
	
func addNewTableToSnookerHall():
	Globals.tableBeingBought.position = Globals.tablePositionsArray[Globals.numberOfTables - 1]
	tables.add_child(Globals.tableBeingBought)
	Globals.tableBeingBought = null
	
