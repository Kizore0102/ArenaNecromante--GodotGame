extends Node

#player buffs

var explosion_buff = false
var speed_shoot = false
var double_shoot = false
var triple_shoot = false

var BuffMenuOverride = false

var player_damage: int



signal cooldown_update

func fix_cooldown():
	cooldown_update.emit()

signal MatchWinned

func match_winned():
	MatchWinned.emit()


func reset_all():
	LevelManager._player_speed = 1
	LevelManager._player_damage = 1
	LevelManager._player_level = 1
	LevelManager._current_exp = 0
	LevelManager._max_exp = 100
	LevelManager._enemy_level = 1
	
	explosion_buff = false
	speed_shoot = false
	double_shoot = false
	triple_shoot = false
