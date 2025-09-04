extends Label

var localMoney = -1

func _process(delta):
	if localMoney != Globals.total_money:
		text = "Money: " + str(Globals.total_money).pad_decimals(2)
		localMoney = Globals.total_money
