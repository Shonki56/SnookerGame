extends Label

var numberOfHours


func _ready() -> void:
	numberOfHours = getRandomNumberOfHours()
	print(str(numberOfHours))
	if numberOfHours == 1:
		text = str(numberOfHours) + " hour please"
	else:
		text = str(numberOfHours) + " hours please"
		
	
func getRandomNumberOfHours() -> int:
	var randomNumber = randi_range(1, 4)
	return randomNumber
	
