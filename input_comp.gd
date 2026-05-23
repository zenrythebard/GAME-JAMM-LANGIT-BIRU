class_name input_comp extends direction_comp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	direction.x = Input.get_axis("move_left","move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	direction = direction.normalized()
