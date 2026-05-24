extends EnemyBasic
var dialogue_trigger : bool = false
@onready var vision_comp: VisionComp = $vision_comp
const BALLOON = preload("uid://cxfbfdtsbb8fd")
const TUTORIAL = preload("uid://d2fycmbqheegn")
const MEETING_YOUNG_HENRY = preload("uid://bk2trrslb14ld")

func _process(delta: float) -> void:
	if vision_comp.sighted == true and dialogue_trigger != true:
		DialogueManager.show_dialogue_balloon_scene(BALLOON, MEETING_YOUNG_HENRY)
		dialogue_trigger = true
