class_name ExpManager
extends Node

var health_multiplier: float = 1





@export var health_component: HealthComponent


func _ready():
	LevelManager.stats_apply.connect(level_up_stats_apply)
	if get_parent().is_in_group("enemy"):
		var _health_update = (float(LevelManager._enemy_level) / 10 + 1)
		health_component._max_health = health_component._max_health * _health_update
		#health_component.equal_max_health()


#var damage = _damage * ((float(LevelManager._player_level) / 10 + 1) * _damage_multiplier)


func level_up_stats_apply():
	
	if health_component != null:
		if get_parent().is_in_group("player"):
			health_component._max_health = round(health_component._max_health * 1.08)
			health_component.equal_max_health()


func enemy_level_up_apply_stats():
	if get_parent().is_in_group("spawned_enemy"):
		if health_component != null:
			var enemy_level =  (float(LevelManager._enemy_level) / 8) + 1
			health_component._max_health = round(health_component._max_health * enemy_level)
			print("Skeletons: Our Level is: ", LevelManager._enemy_level)
			print("Skeletons: Our Hp is: ", health_component._curr_health)
			health_component.equal_max_health()
	
