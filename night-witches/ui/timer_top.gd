extends Control


@onready var timer_text : RichTextLabel = $RichTextLabel
@onready var timer : Timer = $"game timer"

var end_triggered : bool = false
func _ready():
	_update_label()  # show initial time



func _update_label():
	var minutes = int(GameVars.cur_time / 60)
	var seconds = int(GameVars.cur_time % 60)
	timer_text.text = "%02d:%02d" % [minutes, seconds]


func _on_game_timer_timeout() -> void:
	if GameVars.night_over == true or GameVars.player_alive == false:
		timer.stop()
		return
	
	GameVars.cur_time += 1
	
	#to take into account the 24 hour clock
	if GameVars.cur_time == 1440:
		GameVars.cur_time = 0000
			
	#to take into acccount the end of the night
	if GameVars.cur_time == 360:
		GameVars.night_over = true
		
	_update_label()
