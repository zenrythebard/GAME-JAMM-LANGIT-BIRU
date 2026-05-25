extends Node2D
const BALLOON = preload("uid://cxfbfdtsbb8fd")
const TUTORIAL = preload("uid://d2fycmbqheegn")
@onready var canvas_modulate: CanvasModulate = $CanvasModulate

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.level_age = 0
	canvas_modulate.visible = true
	DialogueManager.show_dialogue_balloon_scene(BALLOON, TUTORIAL)

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("exit_game"):
		get_tree().change_scene_to_file("res://main_menu.tscn")
