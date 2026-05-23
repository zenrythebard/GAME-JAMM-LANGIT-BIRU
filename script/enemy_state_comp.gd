class_name EnemyStateComp extends StateComp
var chasestate : bool

func _ready() -> void:
	direction_comp.chase = true
