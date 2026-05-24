extends RayCast2D
@onready var vision_comp: VisionComp = $".."
var contact : bool = false
@onready var timer: Timer = $"../Timer"

func _ready() -> void:
	target_position.x = vision_comp.body.vision_distance

func _physics_process(delta: float) -> void:
	rotation_degrees += 5
	check_vision()
	if is_colliding():
		if get_collider() is Player:
			contact = true
			return
		else:
			contact = false
	else:
		contact = false

func check_vision():
	if contact:
		vision_comp.sighted = true
		timer.start(vision_comp.attention_time)
		await timer.timeout
		vision_comp.sighted = false
