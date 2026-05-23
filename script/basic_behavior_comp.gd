class_name BasicBehaviorComp extends DirectionComp
@export var body: CharacterBody2D
var target : CharacterBody2D 

func _ready() -> void:
	target = body.target

func _physics_process(delta: float) -> void: 
	if target == null:
		return
	var target_pos = target.global_position - body.global_position 
	direction = target_pos
