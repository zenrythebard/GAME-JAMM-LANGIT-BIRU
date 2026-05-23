class_name movement_comp extends Node2D

@export var speed: float
@export var body: CharacterBody2D
var direction: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	body.velocity = direction * speed
	body.move_and_collide(body.velocity * delta)
	body.move_and_slide()
	pass
