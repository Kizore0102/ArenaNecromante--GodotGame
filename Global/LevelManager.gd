extends Node


var _current_exp: float = 0
var _max_exp: float = 100.0
var _player_level: int = 1


var _player_speed: float = 1
var _player_damage: float = 1




var pending_levels: int = 0
var choosing_buff_menu = false




var bullet_current_damage: float


signal stats_apply
signal buff_select
signal enemy_stats_apply


func player_level_manager(gained_exp):
	print("------------- level manager called --------------")
	_current_exp = _current_exp + gained_exp
	
	#pending_levels += gained_exp
	
	
	while _current_exp > _max_exp:
		#for exp in pending_levels:
		#_current_exp += exp
		print("tengo xp: ",exp)
		player_level_up()
	
	
		print("Witch: my level is ",_player_level, "!")
		print("Witch: i have ", _current_exp, " of exp")
		print("Witch: i need ", _max_exp, " to level up!")
	
signal buff_menu_pause

func player_level_up():
	if _current_exp > _max_exp:
		_player_level += 1
		stats_apply.emit()
		buff_menu_pause.emit()
		buff_select.emit()
	
	
	_current_exp -= _max_exp
	_max_exp = round(_max_exp * 1.4)
	
	#pending_levels += 1
	#try_open_buffs_menu()
	





func try_open_buffs_menu():
	if choosing_buff_menu:
		return
	
	if pending_levels <= 0:
		return
	
	choosing_buff_menu = true
	pending_levels -= 1
	
	buff_select.emit()



var _enemy_level: int = 1
var enemys_current_health: float

func enemy_level_manager():
	_enemy_level += 1
	enemy_stats_apply.emit()
