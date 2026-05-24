extends AnimatedSprite2D
@export var state_comp : StateComp
var dash_played : bool = false
var attack_played : bool = false
@export var player : Player  
const PLAYER_OLD = preload("uid://qx8v55c1xjg")
const PLAYER_YOUTH = preload("uid://bbscml3kehwme")
const PLAYER_KID = preload("uid://rhsfd7nfhsuw")
const PLAYER_ADULT = preload("uid://madgr7myctku")
@onready var input_comp: InputComp = $"../InputComp"
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _physics_process(delta: float) -> void:
	match player.level_age:
		1:
			sprite_frames = PLAYER_OLD
		2:
			sprite_frames = PLAYER_ADULT
		3:
			sprite_frames = PLAYER_YOUTH
		4:
			sprite_frames = PLAYER_KID
	if state_comp.state == "idle":
		play("idle")
		audio_stream_player_2d.stream = null
	if state_comp.state.contains("moving"):
		play("walk")
		if input_comp.direction.x > 0:
			flip_h = true
		if input_comp.direction.x < 0:
			flip_h = false
	if state_comp.state != "dashing":
		dash_played = false
	if state_comp.state != "attacking":
		attack_played = false
	if state_comp.state == "attacking" and attack_played == false:
		attack_played = true
		if state_comp.prev_state == "moving_down":
			play("attack_down")
		else:
			play("attack")
		audio_stream_player_2d.stream = preload("uid://ch17viiq8b25n") 
		audio_stream_player_2d.play() 
	if state_comp.state == "dashing" and dash_played == false:
		dash_played = true
		play("dash")
		audio_stream_player_2d.stream = preload("uid://80vajc6vfnib")
		audio_stream_player_2d.play() 

		
