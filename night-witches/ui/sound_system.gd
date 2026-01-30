extends Node

@onready var main_track : AudioStreamPlayer = $"main track"
#for engine on/off
@onready var glide_sound : AudioStreamPlayer = $"plane sounds/glide"
@onready var engine_sound : AudioStreamPlayer = $"plane sounds/engine on"
#explosions
@onready var explosions : Node = $explosions
#alarms
@onready var alarm_siren : AudioStreamPlayer = $alarm
#enemy guns
@onready var gun_sounds : AudioStreamPlayer = $"enemy guns"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_track.play()
	engine_sound.play()

#
#
#	public functions
#
#

func switch_engine(engine : bool):
	if engine == true:
		engine_sound.play()
		glide_sound.stop()
	else:
		glide_sound.play()
		engine_sound.stop()

func explosion_sound():
	var random_child = explosions.get_children().pick_random()
	random_child.play()

func plane_shooting(switch : bool):
	if switch == true:
		pass
	else:
		pass

func switch_alarm(switch : bool):
	if switch == true:
		alarm_siren.play()
	else:
		alarm_siren.stop()
