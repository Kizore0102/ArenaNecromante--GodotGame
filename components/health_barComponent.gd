class_name HealthBarComponent
extends ProgressBar

@onready var damage_bar = $DamageBar
@onready var timer = $Timer

var health: float #:  set = set_health


func set_health(new_health):
	var previus_health = health
	health = min(new_health, max_value)
	value = health
	damage_bar.max_value = max_value
	
	
	
	if health <= 0:
		#queue_free()
		pass
	
	
	if health < previus_health:
		#print("Skeleton: I rememeber to have ", previus_health, " of health")
		if timer.is_stopped():
			damage_bar.value = previus_health
		timer.start()
	else:
		damage_bar.max_value = max_value
		#damage_bar.value = health
		pass
		
	
	
	

func init_health(_health):
	health = _health
	max_value = health
	value = health
	#damage_bar.max_value = health
	#damage_bar.value = health


func _on_timer_timeout():
	damage_bar.value = health
