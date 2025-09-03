extends Control
@onready var money_timer: Label = $MoneyTimer

func _ready() -> void:
	Globals.moneyLabelsArray.append(money_timer)
