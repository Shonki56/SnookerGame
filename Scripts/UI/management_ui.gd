extends Control
@onready var v_box_container: VBoxContainer = $TurnTablesOnOffBox
@onready var h_box_container: GridContainer = $HBoxContainer

var tableManager = preload("res://Scenes/UI/snooker_table_manager_button.tscn")

func _ready() -> void:
	createButtons()
	Globals.updateTableButtonsArray.connect(createCustomTableManager)
	#Globals.updateTableButtonsArray.connect(createButtonForNewTablesBeingAdded)
	

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

	
func _on_button_pressed(button: Button):
	var buttonIndex = -1
	for i in range(Globals.buttonsArray.size()):
		if Globals.buttonsArray[i] == button:
			buttonIndex = i
			break
	if buttonIndex != -1:
		Globals.tablesArray[buttonIndex].turnTableOnOrOff()
		changeButtonText(Globals.buttonsArray[buttonIndex], Globals.tablesArray[buttonIndex].isTableBeingUsed, buttonIndex)
		
func changeButtonText(button: Button, isTableOn: bool, tableIndex: int):
	if isTableOn == true:
		button.text = "Turn Table " + str(tableIndex + 1) + " Off"
	else:
		button.text = "Turn Table " + str(tableIndex + 1) + " On"
		
	
		

func createSingleButton(buttonNumber):
	var button = Button.new()
	v_box_container.add_child(button)
	Globals.buttonsArray.append(button)
	button.pressed.connect(func(): _on_button_pressed(button))
	button.text = "Table " + str(buttonNumber + 1)
	
func createButtonForNewTablesBeingAdded():
	var button = Button.new()
	v_box_container.add_child(button)
	Globals.buttonsArray.append(button)
	button.pressed.connect(func(): _on_button_pressed(button))
	button.text = "Table " + str(Globals.buttonsArray.size())
	
func createButtons():
	for i in range(Globals.numberOfTables):
		createSingleButton(i)
		
func createCustomTableManager():
	var newManager = tableManager.instantiate()
	h_box_container.add_child(newManager)
	newManager.tableNumberForButtonsID = Globals.numberOfTables - 1
	
	

		
