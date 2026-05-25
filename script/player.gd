class_name Player extends CharacterBody2D

@export var level_age : int
@onready var timer: Timer = $Timer
var health : float = 10
var speed: float
var damage : float
var dash_speed: float
var weight: float
var knockback: float
var soul_level : float = 0
var max_health : float 
@onready var health_comp: HealthComp = $health_comp
var prev_age : int 
@onready var state_comp: StateComp = $state_comp
@export_enum("up", "down", "left", "right") var start_direction

func _ready() -> void:
	match start_direction:
		2: 
			state_comp.state = "moving_left"
		1: 
			state_comp.state = "moving_right"
		4: 
			state_comp.state = "moving_up"
		3: 
			state_comp.state = "moving_down"

func _physics_process(delta: float) -> void:
	soul_check()
	prev_age = level_age
	match level_age:
		0: 
			level_age = 1
			max_health = 10
			weight = 3
			knockback = 0.7
			speed = 50
			damage = 1
			dash_speed = 30
		1: #old
			max_health = 10
			weight = 3
			knockback = 0.7
			speed = 50
			damage = 1
			dash_speed = 30
		2: #adult
			max_health = 15
			weight = 3
			knockback = 1
			speed = 100
			damage = 1.5
			dash_speed = 100
		3: #youth
			max_health = 20
			weight = 2
			knockback = 1.2
			speed = 120
			damage = 2
			dash_speed = 120
		4: #child
			max_health = 10
			weight = 1
			knockback = 0.7
			speed = 100
			damage = 1
			dash_speed = 150
	if prev_age < level_age and prev_age != 0:
		health_comp.health += max_health * 0.25
	else:
		return

func soul_check():
	if Global.level_age >= 0:
		level_age = 1
	if Global.level_age >= 12:
		level_age = 2
	if Global.level_age >= 35:
		level_age = 3
	if Global.level_age >= 42:
		level_age = 4

func _on_timer_timeout() -> void:
	if Global.level_age > 0:
		Global.level_age -= 1
