class_name HealthComp extends Node2D
@export var health : float
@export var body : CharacterBody2D


func _process(delta: float) -> void:
	if health == 0:
		body.queue_free()
	
	
