class_name EnemyBasic extends CharacterBody2D

@export var health : float
@export var speed: float
@export var dash_speed: float
@export var damage : float
@export var attention_time : float
@export var attack_distance : float
@export var vision_distance : float
@export var soul_level : float
@export var weight: float
@export var knockback: float
@export var player : Player
@export var start_point : Node2D
@export var end_point : Node2D
var target : Node2D
@onready var point_light_2d: PointLight2D = $PointLight2D
var max_health : float 

func _ready() -> void:
	max_health = health
	if point_light_2d == null:
		return
	point_light_2d.queue_free()
	
	
