class_name NavigationComp extends DirectionComp
@export var body : CharacterBody2D
var goal : Node2D
var start_point : Node2D
var end_point : Node2D
var player : CharacterBody2D
var nav_point_direction : Vector2
var chase : bool 

func _ready() -> void:
	player = body.player
	start_point = body.start_point
	end_point = body.end_point
	goal = start_point
	target_position = goal.global_position
	
func _physics_process(delta: float) -> void:
	direction = nav_point_direction
	if chase:
		goal = player
		target_position = goal.global_position
		chase_player()
	else:
		patrol()
		
func patrol():
	if !is_target_reached():
		nav_point_direction = body.to_local(get_next_path_position()).normalized()
	if is_target_reached() and goal == start_point:
		goal = end_point
		target_position = goal.global_position
	if is_target_reached() and goal == end_point:
			goal = start_point
			target_position = goal.global_position
	if goal == player:
			goal = start_point
			target_position = goal.global_position

func chase_player():
	if !is_target_reached():
		nav_point_direction = body.to_local(get_next_path_position()).normalized()
	if is_target_reached():
		goal = player
		target_position = goal.global_position
