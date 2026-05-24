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
	match state_comp.state:
		"moving_right":
			rotation_degrees = -45
		"moving_left":
			rotation_degrees = 225
		"moving_down":
			rotation_degrees = 90
		"moving_up":
			rotation_degrees = -45
		"attacking":
			attack_anim = "attack"
		"attacking_down":
			attack_anim = "attack_down"
	var attack_frames : float = sprite.sprite_frames.get_frame_count(attack_anim)
	var attack_dur : float = sprite.sprite_frames.get_animation_speed(attack_anim)
	attack_speed = attack_frames / attack_dur
	if state_comp.state == "attacking" or state_comp.state == "attacking_down":
		damage = body.damage
		if sprite.animation.contains("attack") and 3 <= sprite.frame and sprite.frame <= 4:
			attacking = true
		elif sprite.animation.contains("attack") and sprite.frame >= 5:
			state_comp.state = ""
			attacking = false
		else:
			attacking = false
	else:
		attacking = false
		
