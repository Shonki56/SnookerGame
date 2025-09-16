extends Label

func _process(delta: float) -> void:
	text = str(getNumberOfTablesBeingUsed()) + "/" + str(Globals.numberOfTables) + " are being used"
	
func getNumberOfTablesBeingUsed() -> int:
	var tablesBeingUsed = 0
	for table in Globals.tablesArray:
		if table.isTableBeingUsed == true:
			tablesBeingUsed += 1
			
	return tablesBeingUsed
			
