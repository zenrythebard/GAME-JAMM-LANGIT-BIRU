extends Control
@onready var player : Player = %player
@onready var constantine_1: Sprite2D = $Constantine1
@onready var constantine_2: Sprite2D = $Constantine2
@onready var constantine_3: Sprite2D = $Constantine3
@onready var constantine_4: Sprite2D = $Constantine4
@onready var health_label: Label = $HealthLabel
@onready var max_health_label: Label = $MaxHealthLabel
@onready var health_label_2: Label = $HealthLabel2
@onready var max_health_label_2: Label = $MaxHealthLabel2
@onready var soul_label: Label = $SoulLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	soul_check()
	player_check()

		
func soul_check():
	if Global.level_age >= 0:
		constantine_1.visible = true
		constantine_2.visible = false
		constantine_3.visible = false
		constantine_4.visible = false
	if Global.level_age >= 12:
		constantine_1.visible = false
		constantine_2.visible = true
		constantine_3.visible = false
		constantine_4.visible = false
	if Global.level_age >= 35:
		constantine_1.visible = false
		constantine_2.visible = false
		constantine_3.visible = true
		constantine_4.visible = false
	if Global.level_age >= 42:
		constantine_1.visible = false
		constantine_2.visible = false
		constantine_3.visible = false
		constantine_4.visible = true

func player_check():
	if player == null:
		print("null")
		return
	health_label.text = str(int(player.health_comp.health))
	health_label_2.text = str(int(player.health_comp.health))
	max_health_label.text = str(int(player.max_health))
	max_health_label_2.text = str(int(player.max_health))
	soul_label.text = str(int(Global.level_age))
