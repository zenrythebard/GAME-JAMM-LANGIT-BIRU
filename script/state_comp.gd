class_name StateComp extends Node2D
@export var body:CharacterBody2D
var state:String
@export var direction_comp: DirectionComp
var prev_state : String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	prev_state = state
	if state == "hurt":
		return
	if state == "dashing":
		return
	if direction_comp.attacking == true:
		state = "attacking"
		return
	
	if body.velocity:
		if direction_comp.direction.x > 0:
			state = "moving_right"
			return
		if direction_comp.direction.x < 0:
			state = "moving_left"	
			return
		if direction_comp.direction.y > 0:
			state = "moving_down"
		if direction_comp.direction.y < 0:
			state = "moving_up"
	else :
		state = "idle"
	

	
