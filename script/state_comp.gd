class_name StateComp extends Node2D
@export var body:CharacterBody2D
var state:String
@export var direction_comp: DirectionComp
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if state == "dashing":
		return
	if direction_comp.attacking == true:
		state = "attacking"
		return
	if body.velocity:
		if body.velocity.x > 0:
			state = "moving_right"
			return
		if body.velocity.x < 0:
			state = "moving_left"	
			return
		if body.velocity.y > 0:
			state = "moving_down"
		if body.velocity.y < 0:
			state = "moving_up"
	else :
		state = "idle"
	

	
