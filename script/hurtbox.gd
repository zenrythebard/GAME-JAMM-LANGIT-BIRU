class_name Hurtbox extends Area2D
@export var health_comp : HealthComp
var entered:bool
var attacked : bool
var current_hitbox : AttackComp = null
var is_hit : bool = false

func _physics_process(delta: float) -> void:
	if current_hitbox == null:
		return
	if is_hit == true:
		return
	if entered and current_hitbox.attacking:
		health_comp.health -= current_hitbox.damage
		is_hit = true
		await get_tree().create_timer(current_hitbox.attack_speed).timeout
		is_hit = false
		return

func _on_area_entered(area: AttackComp) -> void:
	entered = true
	current_hitbox = area

func _on_area_exited(area: AttackComp) -> void:
	entered = false
	current_hitbox = null
