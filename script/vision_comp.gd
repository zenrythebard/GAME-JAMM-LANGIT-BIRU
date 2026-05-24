class_name VisionComp extends Node2D
@export var body : CharacterBody2D
var sighted: bool = false
var attention_time : float

func _ready() -> void:
	attention_time = body.attention_time
	
