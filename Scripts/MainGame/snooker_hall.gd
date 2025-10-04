extends Node2D
@onready var tables: Node = $Tables
@onready var management_ui: Control = $ManagementUI
@onready var custom_tabs_for_ui: Control = $Camera2D/CustomTabsForUI

var newCustomer = preload("res://Scenes/People/customer.tscn")
var snookerTable = preload("res://Scenes/SnookerHall/snooker_table.tscn")
@onready var add_customer: Button = $AddCustomer

var pathsToBar = []

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("OpenUIMenu"):
		custom_tabs_for_ui.visible = !custom_tabs_for_ui.visible
	if custom_tabs_for_ui.visible == true:
		Globals.isManagementPanelVisible = true
	else:
		Globals.isManagementPanelVisible = false


func _ready():
	pathsToBar = [$PathToBar1, $PathToBar2, $PathToBar3]
	Globals.boughtNewTable.connect(addNewTableToSnookerHall)
	#add_customer.pressed.connect(generateCustomer)
	add_customer.pressed.connect(createCustomer)
	
func addNewTableToSnookerHall():
	Globals.tableBeingBought.position = Globals.tablePositionsArray[Globals.numberOfTables - 1]
	tables.add_child(Globals.tableBeingBought)
	Globals.tableBeingBought = null
	
func generateCustomer():
	var customer = newCustomer.instantiate()
	var pathToFollow = pathsToBar.pick_random().get_node("Path1")
	pathToFollow.add_child(customer)
	
func createCustomer():
	var pathToFollow = pathsToBar.pick_random()
	var follow = PathFollow2D.new()
	pathToFollow.add_child(follow)
	var followScript = load("res://Scripts/People/path_follow_2d.gd")
	follow.set_script(followScript)
	follow.loop = false
	follow.rotates = false
	follow.rotation = 0.0
	
	var customer = newCustomer.instantiate()
	follow.add_child(customer)
	
	follow.progress = 0
	follow.set_process(true)
	
	
	
	
