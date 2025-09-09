extends Node

signal updateTableButtonsArray
signal boughtNewTable
signal showPopUp
	
func updateTablesArrayAndNumOfTables(table):
	tablesArray.append(table)
	numberOfTables += 1
	
var tableBeingBought

var numberOfTables = 0
var tablesArray = []
var buttonsArray = []
var moneyLabelsArray = []
var tablePositionsArray = [Vector2(-1125, 102), Vector2(-861, 102), Vector2(-597, 102), Vector2(-333, 102), Vector2(-1125, 422), Vector2(-861, 422), Vector2(-597, 422), Vector2(-333, 422)]
var buttonPressedIndex
var maxTablesCount = 8
var total_money = 200
var isManagementPanelVisible = false
var tableInfo = {
	"Bad": {"priceToBuy": 20, "quality": tableQuality.BAD, "pricePerHour": 20, "qualityString": "Bad"},
	"Good": {"priceToBuy": 50, "quality": tableQuality.GOOD, "pricePerHour": 50, "qualityString": "Good"},
	"Pro": {"priceToBuy": 100, "quality": tableQuality.PRO, "pricePerHour": 100, "qualityString": "Pro"}
}


var popUpMessages = {
	"NotEnoughMoney" : "Insuffcient Funds",
	"TooManyTables" : "Maximum Tables Reached"
}

var currentPopUpMessage: String
enum tableQuality {BAD, GOOD, PRO}

var cameraPosition


		
