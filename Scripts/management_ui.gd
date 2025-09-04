extends Control
@onready var v_box_container: VBoxContainer = $TurnTablesOnOffBox

func _ready() -> void:
	createButtons()
	Globals.updateTableButtonsArray.connect(createButtonForNewTablesBeingAdded)
	

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
		

func createSingleButton(buttonNumber):
	var button = Button.new()
	v_box_container.add_child(button)
	button.position.x = buttonNumber * 200
	button.position.y = 100
	Globals.buttonsArray.append(button)
	button.pressed.connect(func(): _on_button_pressed(button))
	button.text = "Table " + str(buttonNumber + 1)
	
func createButtonForNewTablesBeingAdded():
	var button = Button.new()
	v_box_container.add_child(button)
	Globals.buttonsArray.append(button)
	button.position.x = Globals.buttonsArray.size()
	button.pressed.connect(func(): _on_button_pressed(button))
	button.text = "Table " + str(Globals.buttonsArray.size())
	
func createButtons():
	for i in range(Globals.numberOfTables):
		createSingleButton(i)

		
