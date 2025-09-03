extends BoxContainer
@onready var basic_table: Button = $"Basic Table"
@onready var club_table: Button = $"Club Table"
@onready var pro_table: Button = $"Pro Table"

var snookerTable = preload("res://Scenes/snooker_table.tscn")

func _ready() -> void:
	basic_table.pressed.connect(buyBadTable)
	club_table.pressed.connect(buyGoodTable)
	pro_table.pressed.connect(buyProTable)

			
func buyBadTable():
	if Globals.total_money >= Globals.tablePrices["Bad"] and Globals.numberOfTables < Globals.maxTablesCount:
		Globals.total_money -= Globals.tablePrices["Bad"]
		Globals.updateMoneyLabelsFunction()
		var newTable = snookerTable.instantiate()
		newTable.tableQuality = Globals.tableQuality.BAD
		newTable.tablePricePerHour = 10.0
		Globals.addTableAndButton()
		
func buyGoodTable():
	if Globals.total_money >= Globals.tablePrices["Good"] and Globals.numberOfTables < Globals.maxTablesCount:
		Globals.total_money -= Globals.tablePrices["Good"]
		Globals.updateMoneyLabelsFunction()
		var newTable = snookerTable.instantiate()
		newTable.tableQuality = Globals.tableQuality.GOOD
		newTable.tablePricePerHour = 50.0
		Globals.addTableAndButton()
		
func buyProTable():
	if Globals.total_money >= Globals.tablePrices["Pro"] and Globals.numberOfTables < Globals.maxTablesCount:
		Globals.total_money -= Globals.tablePrices["Pro"]
		Globals.updateMoneyLabelsFunction()
		var newTable = snookerTable.instantiate()
		newTable.tableQuality = Globals.tableQuality.PRO
		newTable.tablePricePerHour = 100.0
		Globals.addTableAndButton()
		
	
	
