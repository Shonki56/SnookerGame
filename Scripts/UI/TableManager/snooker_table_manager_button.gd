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
			


func _on_turn_on_off_turned_table_on() -> void:
	for table in Globals.tablesArray:
		if table.tableID == tableNumberForButtonsID:
			print(str(table.tableID))
			if table.isTableBeingUsed == true:
				table_number.label_settings.font_color = Color.RED
			else:
				table_number.label_settings.font_color = Color.WHITE
			
