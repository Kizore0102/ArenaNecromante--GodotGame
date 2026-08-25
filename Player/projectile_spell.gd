extends Node2D


var spd = 490
var _explosion = load("res://Player/explosion.tscn")

#@export var damage = 20 * LevelManager._player_damage


func _process(delta):
	position += transform.x * spd * delta
	




func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	#print(get_parent(), " deleted")


func explosion(_damage):
	if EventBus.explosion_buff == true:
		call_deferred("call_explosion", _damage)

func call_explosion(_damage):
	var _explosion_instance = _explosion.instantiate()
	get_tree().root.add_child(_explosion_instance)
	_explosion_instance.global_position = self.global_position
	_explosion_instance.rotation = rotation
	print("exproidu ", _damage)
