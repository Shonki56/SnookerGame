extends Node2D
@onready var tables: Node = $Tables
@onready var management_ui: Control = $ManagementUI
@onready var path_follow_2d: PathFollow2D = $Path2D/PathFollow2D
var newCustomer = preload("res://Scenes/People/customer.tscn")
var snookerTable = preload("res://Scenes/SnookerHall/snooker_table.tscn")
@onready var add_customer: Button = $AddCustomer

func _ready():
	Globals.boughtNewTable.connect(addNewTableToSnookerHall)
	add_customer.pressed.connect(generateCustomer)
	
func addNewTableToSnookerHall():
	Globals.tableBeingBought.position = Globals.tablePositionsArray[Globals.numberOfTables - 1]
	tables.add_child(Globals.tableBeingBought)
	Globals.tableBeingBought = null
	
func generateCustomer():
	var customer = newCustomer.instantiate()
	path_follow_2d.add_child(customer)
	
	
	
