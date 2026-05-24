extends EnemyBasic
var dialogue_trigger : bool = false
@onready var vision_comp: VisionComp = $vision_comp
const BALLOON = preload("uid://cxfbfdtsbb8fd")
const TUTORIAL = preload("uid://d2fycmbqheegn")

func _process(delta: float) -> void:
	if dialogue_trigger == true:
		return
	if vision_comp.sighted == true:
		DialogueManager.show_dialogue_balloon_scene(BALLOON, TUTORIAL)
