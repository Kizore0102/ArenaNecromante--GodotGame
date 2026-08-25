extends Control



var _main_game_scene = load("res://Scenes/main.tscn")



func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")





func _on_quit_pressed():
	get_tree().quit()
