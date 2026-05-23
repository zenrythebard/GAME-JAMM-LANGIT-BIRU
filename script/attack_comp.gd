class_name AttackComp extends Area2D
@export var state_comp: StateComp


func _physics_process(delta: float) -> void:
	match state_comp.state:
		"moving_right":
			rotation_degrees = 0
		"moving_left":
			rotation_degrees = 180
		"moving_up":
			rotation_degrees = 270
		"moving_down":
			rotation_degrees = 90
	pass

func _on_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
