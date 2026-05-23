class_name AttackComp extends Area2D
@export var state_comp: StateComp
@export var sprite: AnimatedSprite2D 
@export var body: CharacterBody2D
var attacking:bool
var attack_speed: float
var attack_anim : String = "attack"
var damage : float

func _ready() -> void:
	damage = body.damage

func _physics_process(delta: float) -> void:
	var attack_frames : float = sprite.sprite_frames.get_frame_count(attack_anim)
	var attack_dur : float = sprite.sprite_frames.get_animation_speed(attack_anim)
	attack_speed = attack_frames / attack_dur
	match state_comp.state:
		"moving_right":
			rotation_degrees = 0
		"moving_left":
			rotation_degrees = 180
		"moving_up":
			rotation_degrees = 270
		"moving_down":
			rotation_degrees = 90
	if state_comp.state == "attacking":
		if sprite.frame >= 3:
			attacking = true
	else:
		attacking = false
		
