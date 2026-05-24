class_name HealthComp extends Node2D
@export var health : float
@export var body : CharacterBody2D
@onready var label: Label = $Label

func _ready() -> void:
	health = body.health

func _process(delta: float) -> void:
	label.text = "Health: " + str(health)
	if health == 0:
		Global.level_age += body.soul_level
		print(Global.level_age)
		body.queue_free()
	
	
