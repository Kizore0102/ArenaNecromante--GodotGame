class_name HurtBox
extends Area2D


@export_enum("player", "enemy", "none") var AttackerClass: String = "none"
@export var _health: HealthComponent
@onready var health_bar = $"../HealthComponent/HealthBar"

#@export var hit_box: HitBox

func _ready():
	pass


func receive_hit(amount: int):
	if _health.has_method("update_health"):
		_health.update_health(amount)
	#health_bar.health = _health._curr_health
	print(get_parent().name,": ai, tomei dano")
