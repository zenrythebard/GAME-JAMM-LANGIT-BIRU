class_name InputComp extends DirectionComp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	direction.x = Input.get_axis("move_left","move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	direction = direction.normalized()
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("attack"):
		attacking = true
		await get_tree().create_timer(1).timeout
		attacking = false
