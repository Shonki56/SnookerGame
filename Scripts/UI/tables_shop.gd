extends BoxContainer

var snookerTable = preload("res://Scenes/SnookerHall/snooker_table.tscn")

func buyTable(tableType):
	# Do some checking to make sure tableType is correct
	var tableToBuy = Globals.tableInfo[tableType]
	if Globals.total_money >= tableToBuy["priceToBuy"] and Globals.numberOfTables < Globals.maxTablesCount:
		Globals.total_money -= tableToBuy["priceToBuy"]
		var newTable = snookerTable.instantiate()
		setTableStats(newTable, tableToBuy)
		updateGlobalVarsAndEmitSignals(newTable)
	elif Globals.total_money < tableToBuy["priceToBuy"]:
		setPoPUpMessage(Globals.popUpMessages["NotEnoughMoney"])
	elif Globals.numberOfTables == 8:
		setPoPUpMessage(Globals.popUpMessages["TooManyTables"])
		
func setTableStats(table, stats):
	table.tableQuality = stats["quality"]
	table.tablePricePerHour = stats["pricePerHour"]
	table.tableQualityString = stats["qualityString"]
	
func updateGlobalVarsAndEmitSignals(table):
	Globals.updateTablesArrayAndNumOfTables(table)
	Globals.tableBeingBought = table
	Globals.boughtNewTable.emit()
	table.tableID = Globals.numberOfTablesBoughtOverall
	Globals.updateTableButtonsArray.emit()
	
func setPoPUpMessage(message):
	Globals.currentPopUpMessage = message
	Globals.showPopUp.emit()
	
		
		
	
	
