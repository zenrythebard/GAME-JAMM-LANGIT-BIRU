extends Camera2D
@export var body: CharacterBody2D

func _process(delta: float) -> void:
	if body == null:
		return
	global_position = body.global_position
