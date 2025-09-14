extends Control
@onready var table_number: Label = $ColorRect/TableNumber
@onready var table_quality_label: Label = $TableQualityLabel

@export var tableNumberForButtonsID: int


func _ready() -> void:
	tableNumberForButtonsID = Globals.numberOfTablesBoughtOverall
	table_number.text = str(Globals.numberOfTables)
	for table in Globals.tablesArray:
		if table.tableID == tableNumberForButtonsID:
			table_quality_label.text = table.tableQualityString
	#if Globals.numberOfTables == 0:
			#table_quality_label.text = Globals.tablesArray[Globals.numberOfTables].tableQualityString
	#else:
			#table_quality_label.text = Globals.tablesArray[Globals.numberOfTables 	- 1].tableQualityString
		
