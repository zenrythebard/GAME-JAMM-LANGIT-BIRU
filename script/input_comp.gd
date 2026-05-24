class_name InputComp extends DirectionComp
@export var attack_comp: AttackComp  
var button_pressed: bool = false
@export var sprite: AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	direction.x = Input.get_axis("move_left","move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	direction = direction.normalized()
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("attack"):
		if attacking == true:
			return
		attacking = true
		button_pressed = true
		await get_tree().create_timer(attack_comp.attack_speed).timeout
		attacking = false
		button_pressed = false

	if Input.is_action_just_pressed("dash") and dashing == false:
		dashing = true
