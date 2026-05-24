class_name Player extends CharacterBody2D

@export var level_age : int

@export var health : float
@export var speed: float
@export var damage : float
@export var dash_speed: float
@export var weight: float
@export var knockback: float
var soul_level : float = 0
var max_health : float 
@onready var health_comp: HealthComp = $health_comp
var prev_age : int 

func _physics_process(delta: float) -> void:
	print(max_health)
	prev_age = level_age
	match level_age:
		0: 
			level_age = 1
		1: #old
			max_health = 10
			weight = 1
			knockback = 1
			speed = 50
			damage = 1
			dash_speed = 30
		2: #adult
			max_health = 15
			weight = 3
			knockback = 2
			speed = 100
			damage = 2
			dash_speed = 100
		3: #youth
			max_health = 20
			weight = 2
			knockback = 2
			speed = 100
			damage = 3
			dash_speed = 150
		4: #child
			max_health = 10
			weight = 2
			knockback = 2
			speed = 100
			damage = 3
			dash_speed = 150
	if prev_age < level_age and prev_age != 0:
		health_comp.health += max_health * 0.25
	else:
		return
