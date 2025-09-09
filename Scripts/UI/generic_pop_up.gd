extends Popup
@onready var timer: Timer = $Timer

func _ready() -> void:
	#timer.timeout.connect(_on_timer_timeout)
	pass

func _on_timer_timeout():
	queue_free()
