class_name MovementComp extends Node2D

var speed: float
var dash_speed: float
@export var body: CharacterBody2D
var direction: Vector2
@export var dir_comp: DirectionComp
@export var state_comp: StateComp  
var base_speed : float
@export var sprite: AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(0.2).timeout
	base_speed = speed
	dash_speed = body.dash_speed
	speed = body.speed
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	direction = dir_comp.direction
	if state_comp.state == "attacking":
		return
	if state_comp.state == "attacking_down":
		await get_tree().create_timer(0.2).timeout
		return
	if direction:
		body.velocity = direction * speed
		body.move_and_slide()
		if state_comp.state != "dashing":
			if dir_comp.dashing:
				state_comp.state = "dashing"
				dash_speed = body.dash_speed
				speed += dash_speed
				await get_tree().create_timer(0.6).timeout
				correct_speed()
				dir_comp.dashing = false
				state_comp.state = ""
		elif dir_comp.dashing:
			dir_comp.dashing = false
			
	else:
		body.velocity = body.velocity.move_toward(Vector2.ZERO,speed)
	
		
		
func correct_speed():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "speed", body.speed, 0.2)
	
	
		
