extends Button
var id: int
signal turnedTableOn()
func _ready() -> void:
	id = Globals.numberOfTablesBoughtOverall

func _pressed() -> void:
	for table in Globals.tablesArray:
		if table.tableID == id:
			table.turnTableOnOrOff()
			turnedTableOn.emit()
