extends Label
@onready var total_money_label: Label = $"."

var localMoney = Globals.total_money

func _ready() -> void:
	$Timer.timeout.connect(startTimer)

func _process(delta):
	if localMoney != Globals.total_money:
		text = "$" + str(Globals.total_money).pad_decimals(2)
		if Globals.total_money > localMoney:
			changeColourOfLabel(Color.GREEN)
		elif Globals.total_money < localMoney:
			changeColourOfLabel(Color.RED)
		localMoney = Globals.total_money
		
func startTimer():
	var tween = create_tween()
	tween.tween_property(label_settings, "font_color",Color(1.0, 1.0, 1.0),0.3)
	
func changeColourOfLabel(colour: Color):
	$".".label_settings.font_color = colour
	$Timer.start()
	
