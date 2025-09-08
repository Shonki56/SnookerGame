class_name TimeSystem extends Node

signal updated


@export var date_time: DateTime
@export var ticks_per_seconds: int = 60

func _process(delta: float) -> void:
		date_time.increase_by_sec(delta * ticks_per_seconds)
		updated.emit(date_time)
		

	
