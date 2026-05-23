class_name Hurtbox extends Area2D
@export var health_comp : HealthComp
var entered:bool
var attacked : bool
var current_hitbox : AttackComp = null
var is_hit : bool = false
var current_item : ItemPickup = null
@export var state_comp : StateComp

func _physics_process(delta: float) -> void:
	if current_hitbox == null:
		return
	if is_hit == true:
		return
	if current_hitbox.attacking:
		if state_comp.state == "dashing":
			print("dodge")
			return
		health_comp.health -= current_hitbox.damage
		is_hit = true
		await get_tree().create_timer(current_hitbox.attack_speed).timeout
		is_hit = false
		return

func _on_area_entered(area: Area2D) -> void:
	if area is AttackComp:
		current_hitbox = area
	if area is ItemPickup:
		current_item = area
		health_comp.health += current_item.health_increase
		current_item.queue_free()
		
func _on_area_exited(area: Area2D) -> void:
	if area is AttackComp:
		current_hitbox = null
	if area is ItemPickup:
		current_item = null
		
	
