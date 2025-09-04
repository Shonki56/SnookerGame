extends BoxContainer
@onready var basic_table: Button = $"Basic Table"
@onready var club_table: Button = $"Club Table"
@onready var pro_table: Button = $"Pro Table"

var snookerTable = preload("res://Scenes/snooker_table.tscn")

func buyTable(tableType):
	# Do some checking to make sure tableType is correct
	var tableToBuy = Globals.tableInfo[tableType]
	if Globals.total_money >= tableToBuy["priceToBuy"] and Globals.numberOfTables < Globals.maxTablesCount:
		Globals.total_money -= tableToBuy["priceToBuy"]
		var newTable = snookerTable.instantiate()
		newTable.tableQuality = tableToBuy["quality"]
		newTable.tablePricePerHour = tableToBuy["pricePerHour"]
		Globals.updateTablesArrayAndNumOfTables(newTable)
		Globals.tableBeingBought = newTable
		Globals.boughtNewTable.emit()
		Globals.updateTableButtonsArray.emit()
		
	
	
