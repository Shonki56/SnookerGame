extends Node

signal updateAllMoneyLabels
signal updateTableButtonsArray
signal boughtNewTable

func _ready() -> void:
	updateAllMoneyLabels.connect(updateMoneyLabelsFunction)
	
func updateMoneyLabelsFunction():
	for label in moneyLabelsArray:
		label.text = "Money: " + str(total_money).pad_decimals(2)
	
func updateTablesArrayAndNumOfTables(table):
	tablesArray.append(table)
	numberOfTables += 1
	
var tableBeingBought

var numberOfTables = 3
var tablesArray = []
var buttonsArray = []
var moneyLabelsArray = []
var tablePositionsArray = [Vector2(-1125, 102), Vector2(-861, 102), Vector2(-597, 102), Vector2(-333, 102), Vector2(-1125, 422), Vector2(-861, 422), Vector2(-597, 422), Vector2(-333, 422)]
var buttonPressedIndex
var maxTablesCount = 8
var total_money = 200
var isManagementPanelVisible = false
var tablePrices = {
	"Bad" : 20,
	"Good" : 60,
	"Pro" : 100
}
enum tableQuality {BAD, GOOD, PRO}

var cameraPosition


		
