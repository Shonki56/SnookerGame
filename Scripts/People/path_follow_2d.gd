extends PathFollow2D


var speed = 0.1

var hasACustomer = true

func _process(delta: float) -> void:
	if progress_ratio != 1:
		progress_ratio += delta * speed


func _on_child_entered_tree(node: Node) -> void:
	progress_ratio = 0.0
