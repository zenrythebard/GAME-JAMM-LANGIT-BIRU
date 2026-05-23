extends AnimatedSprite2D
@export var state_comp : StateComp

func _physics_process(delta: float) -> void:
	if state_comp.state.contains("moving"):
		play("walk")
		match state_comp.state:
			"moving_right":
				flip_h = false
			"moving_left":
				flip_h = true
	if state_comp.state == "idle":
		play("idle")
	if state_comp.state == "attacking":
		play("attack")
	if state_comp.state == "dashing":
		play("dash")
		
