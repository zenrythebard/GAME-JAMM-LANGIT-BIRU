class_name MovementComp extends Node2D

@export var speed: float
@export var dash_speed: float
@export var body: CharacterBody2D
var direction: Vector2
@export var dir_comp: DirectionComp
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speed = body.speed
	dash_speed = body.dash_speed
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	direction = dir_comp.direction
	if direction:
		body.velocity = direction * speed
		body.move_and_collide(body.velocity * delta)
		body.move_and_slide()
	else:
		body.velocity = body.velocity.move_toward(Vector2.ZERO,speed)
		
	if dir_comp.dashing:
		var tween = get_tree().create_tween()
		speed += dash_speed
		tween.tween_property(self, "speed", body.speed, 0.5)
		await tween.finished
		
