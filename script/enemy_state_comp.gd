class_name EnemyStateComp extends StateComp
var chasestate : bool
@export var vision_comp : VisionComp 

func _process(delta: float) -> void: 
	direction_comp.chase = vision_comp.sighted
