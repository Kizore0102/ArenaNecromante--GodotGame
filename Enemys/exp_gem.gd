extends Area2D


func _on_body_entered(body):
	LevelManager.player_level_manager(15)
	queue_free()




func _on_magnet_body_entered(body):
	var direction = (global_position - body.global_position).normalized()
	global_position = direction * 15
