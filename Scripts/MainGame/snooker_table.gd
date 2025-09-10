extends Node2D
@onready var color_rect: ColorRect = $ColorRect
@onready var pay_timer: Timer = $PayTimer
@export var tableQuality: Globals.tableQuality
@export var tablePricePerHour: float
@onready var time_system: TimeSystem = $TimeSystem


func _ready() -> void:
	pay_timer.timeout.connect(payForFullHour)
	print(str(Globals.currentTime.minutes))


var isTableBeingUsed = false

var currentSessionPrice = 0

var payTimerHourInSeconds = 10.0

var tableQualityString: String

var timeOnStart
var timeOnEnd
var totalTimeTableWasOn

func setTimeOnStart():
	timeOnStart = Globals.currentTime.duplicate()
	print_debug(str(timeOnStart.hours) + ":" + str(timeOnStart.minutes))
	
func setTimeEnd():
	timeOnEnd = Globals.currentTime.duplicate()
	print_debug(str(timeOnEnd.hours) + ":" + str(timeOnEnd.minutes))
	
func calculateTotalTimeTableWasOn():
	var totalHours = timeOnEnd.hours - timeOnStart.hours
	var totalMinutes = timeOnEnd.minutes - timeOnStart.minutes
	print("Total minutes table was on:" + str(totalMinutes))

func turnTableOnOrOff():
	if color_rect.color == Color.WHITE:
		color_rect.color = Color.GREEN
		setTimeOnStart()
	else:
		color_rect.color = Color.WHITE
		isTableBeingUsed = !isTableBeingUsed
		pauseOrPlayTimerAndPayMoney(pay_timer)
		setTimeEnd()
		calculateTotalTimeTableWasOn()
		
func calculatePriceForTableUse():
	#TODO Do this
	pass
	
func payForFullHour():
	currentSessionPrice += tablePricePerHour
	
func payForIncompleteHour():
	var incompleteTableMultiplier = tablePricePerHour / payTimerHourInSeconds
	var timeToChargeFor = pay_timer.wait_time - pay_timer.time_left
	var priceToCharge = timeToChargeFor * incompleteTableMultiplier
	currentSessionPrice += priceToCharge
	
func pauseOrPlayTimerAndPayMoney(timer: Timer):
	if timer.is_stopped() == true or timer.paused == true:
		timer.paused = false
		timer.start()
		print(str(tablePricePerHour))
	elif timer.paused == false:
		timer.paused = true
		payForIncompleteHour()
		Globals.total_money += currentSessionPrice
		
		currentSessionPrice = 0
	
	
