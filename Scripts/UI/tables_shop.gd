extends VBoxContainer

var snookerTable = preload("res://Scenes/SnookerHall/snooker_table.tscn")
@onready var tables_shop: VBoxContainer = $"."

@export var table_shop_array: Array[Table] = []

func _ready() -> void:
	create_table_shop_buttons()

func create_table_shop_buttons():
	for table in table_shop_array:
		var button = Button.new()
		button.text = table.table_quality
		button.pressed.connect(buyTable.bind(table))
		tables_shop.add_child(button)
		
func buyTable(table: Table):
	if Globals.total_money >= table.table_price and Globals.numberOfTables < Globals.maxTablesCount:
		Globals.total_money -= table.table_price
		var newTable = snookerTable.instantiate()
		newTable.tablePricePerHour = table.table_per_per_hour
		newTable.tableQualityString = table.table_quality
		newTable.table_self = table
		updateGlobalVarsAndEmitSignals(newTable)
	elif Globals.total_money < table.table_price:
		setPoPUpMessage(Globals.popUpMessages["NotEnoughMoney"])
	elif Globals.numberOfTables == 8:
		setPoPUpMessage(Globals.popUpMessages["TooManyTables"])

func updateGlobalVarsAndEmitSignals(table):
	Globals.updateTablesArrayAndNumOfTables(table)
	Globals.tableBeingBought = table
	Globals.boughtNewTable.emit()
	table.tableID = Globals.numberOfTablesBoughtOverall
	Globals.updateTableButtonsArray.emit()
	
func setPoPUpMessage(message):
	Globals.currentPopUpMessage = message
	Globals.showPopUp.emit()
	
		
		
	
	
