extends Node2D
@onready var color_rect: ColorRect = $ColorRect
@onready var pay_timer: Timer = $PayTimer
@export var tableQuality: Globals.tableQuality
@export var tablePricePerHour: float
@onready var time_system: TimeSystem = $TimeSystem

var isTableBeingUsed = false

var currentSessionPrice = 0

var tableQualityString: String

var timeOnStart
var timeOnEnd
var totalTimeTableWasOn

func setTimeOnStart():
	timeOnStart = Globals.currentTime.duplicate()
	
func setTimeEnd():
	timeOnEnd = Globals.currentTime.duplicate()

func turnTableOnOrOff():
	if color_rect.color == Color.WHITE:
		color_rect.color = Color.GREEN
		setTimeOnStart()
		isTableBeingUsed = true
	else:
		isTableBeingUsed = false
		color_rect.color = Color.WHITE
		isTableBeingUsed = !isTableBeingUsed
		setTimeEnd()
		calculatePriceForTableUse()
		addMoneyAndResetCurrentSessionAmount()
		
		
func calculatePriceForTableUse():
	var totalHours = timeOnEnd.hours - timeOnStart.hours
	var totalMinutes = timeOnEnd.minutes - timeOnStart.minutes 
	var hoursPrice = totalHours * tablePricePerHour
	var minutesPrice = (totalMinutes * tablePricePerHour) / 60
	currentSessionPrice = hoursPrice + minutesPrice 
	
func addMoneyAndResetCurrentSessionAmount():
	Globals.total_money += currentSessionPrice
	showPopUpForMoneyMade()
	currentSessionPrice = 0
	
func payForFullHour():
	currentSessionPrice += tablePricePerHour
	
func showPopUpForMoneyMade():
	Globals.currentPopUpMessage = str(currentSessionPrice).pad_decimals(2)
	Globals.showPopUp.emit()
