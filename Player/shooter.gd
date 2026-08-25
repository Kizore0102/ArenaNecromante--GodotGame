extends Node2D
var _bullet = load("res://Player/projectile_spell.tscn")
var _double_shoot = load("res://Player/Projectiles/double_shoot.tscn")
var triple_shoot = load("res://Player/Projectiles/triple_shoot.tscn")


var can_shoot = true
@export var _timer: Timer
@export var shooter: Node2D
@export var bullet_spawn: Marker2D



func _ready():
	EventBus.cooldown_update.connect(fix_cooldown)
	



func _process(_delta):
	look_at(get_global_mouse_position())
	shoot_bullet()
	

func fix_cooldown():
	
	_timer.wait_time -= 0.032
	
	if _timer.wait_time < 0.1:
		_timer.wait_time = 0.1


func shoot_bullet():
	var _bullet_instance
	if Input.is_action_pressed("shoot_key"):
		if can_shoot == true:
			#print("shooted at ", get_global_mouse_position())
			if EventBus.double_shoot == true:
				if EventBus.triple_shoot == true:
					_bullet_instance = triple_shoot.instantiate()
				else:
					_bullet_instance = _double_shoot.instantiate()
			else:
				_bullet_instance = _bullet.instantiate()
			get_tree().root.add_child(_bullet_instance)
			_bullet_instance.global_position = bullet_spawn.global_position
			_bullet_instance.rotation = shooter.rotation
			can_shoot = false
			_timer.start()


func _on_timer_timeout():
	can_shoot = true
