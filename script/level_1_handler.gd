extends Node2D
const BALLOON = preload("uid://cxfbfdtsbb8fd")
const TUTORIAL = preload("uid://d2fycmbqheegn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.show_dialogue_balloon_scene(BALLOON, TUTORIAL)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
