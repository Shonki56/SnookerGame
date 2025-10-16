extends Node

signal updateTableButtonsArray
signal boughtNewTable
signal showPopUp
	
func updateTablesArrayAndNumOfTables(table):
	tablesArray.append(table)
	numberOfTables += 1
	numberOfTablesBoughtOverall += 1
	
func deleteFromTablesArrayAndButtonsArray(tableAndButtonId: int):
	tablesArray.pop_at(tableAndButtonId) 
	buttonsArray.pop_at(tableAndButtonId)
	numberOfTables -= 1
	
func updateTableLabelNumbers():
	for i in range(buttonsArray.size()):
		buttonsArray[i].table_number.text = str(i + 1)
	
var tableBeingBought

var currentTime: DateTime

var numberOfTablesBoughtOverall = 0

var numberOfTables = 0
var tablesArray = []
var buttonsArray = []
var moneyLabelsArray = []
var tablePositionsArray = [Vector2(-700, 102), Vector2(-400, 102), Vector2(-100, 102), Vector2(200, 102), Vector2(-700, 422), Vector2(-400, 422), Vector2(-100, 422), Vector2(200, 422)]
var buttonPressedIndex
var maxTablesCount = 8
var total_money = 200
var isManagementPanelVisible = false


var popUpMessages = {
	"NotEnoughMoney" : "Insuffcient Funds",
	"TooManyTables" : "Maximum Tables Reached"
}

var currentPopUpMessage: String

var cameraPosition


		
