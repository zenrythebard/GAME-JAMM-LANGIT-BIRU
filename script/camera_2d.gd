extends Camera2D
@export var body: CharacterBody2D

func _process(delta: float) -> void:
	if body == null:
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_packed(preload("uid://cmv5rqf0di7c2"))
		return
	global_position = body.global_position
