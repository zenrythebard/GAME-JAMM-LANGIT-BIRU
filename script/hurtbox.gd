class_name Hurtbox extends Area2D
@export var health_comp : HealthComp
var entered:bool
var attacked : bool
var current_hitbox : AttackComp = null
var is_hit : bool = false
var current_item : ItemPickup = null
@export var body : CharacterBody2D
@export var state_comp : StateComp
var attack_velocity : Vector2
var vel : Vector2

func _physics_process(delta: float) -> void:
	body.move_and_collide(attack_velocity)
	print(attack_velocity)
	attack_velocity = attack_velocity.move_toward(Vector2.ZERO, 0.1)
	if current_hitbox == null:
		return
	if is_hit == true:
		return
	if current_hitbox.attacking:
		if state_comp.state == "dashing":
			print("dodge")
			return
		knockback()
		health_comp.health -= current_hitbox.damage
		health_comp.health_change = true
		is_hit = true
		await get_tree().create_timer(current_hitbox.attack_speed).timeout
		is_hit = false
		health_comp.health_change = false
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
		
func knockback():
	var knock_dir : Vector2 = -(current_hitbox.body.position - body.position).normalized()
	attack_velocity = knock_dir * 5 * current_hitbox.body.knockback / body.weight 
