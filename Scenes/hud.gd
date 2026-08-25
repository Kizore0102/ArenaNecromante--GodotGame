extends Control

@export var label_timer: Label
@export var round_finish_timer: Timer
@onready var match_winned = $CanvasLayer/MatchWinned
signal call_last_boss



func _process(_delta):
	var timer_show = round_finish_timer.time_left
	label_timer.text = str(round(timer_show))


func game_ended():
	#match_winned.visible = true
	call_last_boss.emit()
