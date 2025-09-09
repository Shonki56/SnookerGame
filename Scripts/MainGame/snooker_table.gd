extends Node2D
@onready var color_rect: ColorRect = $ColorRect
@onready var pay_timer: Timer = $PayTimer
@export var tableQuality: Globals.tableQuality
@export var tablePricePerHour: float


func _ready() -> void:
	pay_timer.timeout.connect(payForFullHour)


var isTableBeingUsed = false

var currentSessionPrice = 0

var payTimerHourInSeconds = 10.0

func turnTableOnOrOff():
	if color_rect.color == Color.WHITE:
		color_rect.color = Color.GREEN
	else:
		color_rect.color = Color.WHITE
	isTableBeingUsed = !isTableBeingUsed
	pauseOrPlayTimerAndPayMoney(pay_timer)
	
func payForFullHour():
	currentSessionPrice += tablePricePerHour
	print(str(tablePricePerHour) + " has been added")
	
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
	
	
