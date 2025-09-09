extends Control
@onready var table_number: Label = $ColorRect/TableNumber
@onready var table_quality_label: Label = $TableQualityLabel

@export var tableNumberForButtonsID: int

func _ready() -> void:
	tableNumberForButtonsID = Globals.numberOfTables
	table_number.text = str(Globals.numberOfTables)
	table_quality_label.text = Globals.tablesArray[Globals.numberOfTables 	- 1].tableQualityString
