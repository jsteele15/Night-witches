extends CharacterBody2D

var plane_entered : bool = false
var starting_point : Vector2
var search_area : Vector2
var point_a : Vector2
var point_b : Vector2
var target : Vector2
var speed: int = 300
var spotlight_range : int = 400
@onready var alarm_sound : AudioStreamPlayer2D = $alarm

#probably needs more levels but it works for now
var speed_by_vis = [{"min": 2, "speed": 300},
{"min": 1, "speed": 200},
{"min": 0, "speed": 100}]

var spotted_plane : bool = false
var plane : CharacterBody2D
func _ready() -> void:
	starting_point = self.global_position
	point_a = starting_point + Vector2(200, 0)
	point_b = starting_point - Vector2(200, 0)
	print(point_a, point_b)
	target = point_b
func _physics_process(delta: float) -> void:
	_move_spotlight(delta)
	_set_spotlight_speed()
#
#
#	private functions
#
#

func _move_spotlight(delta: float):
	"""i guess move the spotlight back and fourth between two positions
	unless the players in it, in which case follow it"""
	var direction = (target - global_position).normalized()
	velocity = direction * speed
	move_and_slide()
	if spotted_plane == false:
		if global_position.distance_to(target) < 5:
			target = point_a if target == point_b else point_b
	else:
		if plane != null:
			target = plane.position
			if global_position.distance_to(starting_point) > spotlight_range:
				target = point_a
				spotted_plane = false
		else:
			target = point_a
			spotted_plane = false

func _set_spotlight_speed() -> int:
	"""change the speed of the spotlight depending on player visibility"""
	#TODO theres an edge case where the planes not 300 but the plane is
	for entry in speed_by_vis:
		if GameVars.current_sus >= entry.min:
			return entry.speed
	return 300

func _on_spotlight_area_body_entered(body: Node2D) -> void:
	if body.has_method("_bomb"):
		alarm_sound.play()
		plane_entered = true
		body.in_spotlight = true
		spotted_plane = true
		if GameVars.allied_planes.get_child_count() > 0:
			for p in GameVars.allied_planes.get_children():
				if p.run_away == false:
					plane = p
					p.run_away = true
					break
		else:
			plane = body


func _on_spotlight_area_body_exited(body: Node2D) -> void:
	if body.has_method("_bomb"):
		plane_entered = false
		#stupid way of doing this but whatever
		body.spotlight_cooldown.start()
