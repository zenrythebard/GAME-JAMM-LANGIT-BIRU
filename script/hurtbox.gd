class_name Hurtbox extends Area2D
var entered:bool
var attacked : bool
var current_hit : AttackComp = null
var is_hit : bool = false

func _physics_process(delta: float) -> void:
	if current_hit == null:
		return
	if is_hit == true:
		return
	if entered and current_hit.attacking:
		print("damage")
		is_hit = true
		await get_tree().create_timer(current_hit.attack_speed).timeout
		is_hit = false
		return

func _on_area_entered(area: AttackComp) -> void:
	entered = true
	current_hit = area

func _on_area_exited(area: AttackComp) -> void:
	entered = false
	current_hit = null
