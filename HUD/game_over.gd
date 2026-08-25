extends Control




func _on_restart_pressed():
	EventBus.reset_all()
	
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_title_screen_pressed():
	EventBus.reset_all()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")





func _on_quit_pressed():
	get_tree().quit()
