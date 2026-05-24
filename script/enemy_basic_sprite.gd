extends AnimatedSprite2D
@export var state_comp : StateComp
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _physics_process(delta: float) -> void:
	if state_comp.state.contains("moving"):
		play("walk")
		match state_comp.state:
			"moving_right":
				flip_h = false
			"moving_left":
				flip_h = true
	if state_comp.state == "attacking":
		play("attack")
	if state_comp.state == "attacking_down":
		play("attack_down")
		audio_stream_player_2d.stream = preload("uid://ch17viiq8b25n")
		audio_stream_player_2d.play()
	if state_comp.state == "dashing":
		play("dash")
		
