extends Control
@onready var animation_player = $AnimationPlayer


func _ready():
	LevelManager.buff_menu_pause.connect(freeze_game)
	if get_parent().name == "GameOver":
		pass
	else:
		hide()
	animation_player.play("RESET")


func resume():
	get_tree().paused = false
	animation_player.play_backwards("Blur")


func pause():
	show()
	get_tree().paused = true
	animation_player.play("Blur")


func show_menu():
	if Input.is_action_just_pressed("esc") and not get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		if not EventBus.BuffMenuOverride:
			resume()
		




func _on_resume_pressed():
	resume()


func _on_restart_pressed():
	resume()
	
	EventBus.reset_all()
	
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().quit()


func _process(_delta):
	show_menu()


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Blur" and !get_tree().paused:
		hide()


func freeze_game():
	get_tree().paused = true
