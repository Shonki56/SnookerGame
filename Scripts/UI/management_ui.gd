extends Control
@onready var v_box_container: VBoxContainer = $TurnTablesOnOffBox
@onready var h_box_container: GridContainer = $HBoxContainer

var tableManager = preload("res://Scenes/UI/snooker_table_manager_button.tscn")

func _ready() -> void:
	Globals.updateTableButtonsArray.connect(createCustomTableManager)
	

func _input(event):
	if Input.is_action_just_pressed("OpenManagementTablet"):
		showManagementTablet()
		
func _process(delta: float) -> void:
	position.x = Globals.cameraPosition.x
	position.y = Globals.cameraPosition.y
		
func showManagementTablet():
	if Globals.isManagementPanelVisible == false:
		visible = true
		Globals.isManagementPanelVisible = true
	else:
		visible = false
		Globals.isManagementPanelVisible = false

		
func createCustomTableManager():
	var newManager = tableManager.instantiate()
	h_box_container.add_child(newManager)
	newManager.tableNumberForButtonsID = Globals.numberOfTablesBoughtOverall
	Globals.buttonsArray.append(newManager)
	print_debug("New table being boughts ID: " + str(newManager.tableNumberForButtonsID))
	
	

		
