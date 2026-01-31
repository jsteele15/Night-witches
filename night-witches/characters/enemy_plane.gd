extends CharacterBody2D


var turn_speed: float = 20.0
var max_speed: float = 300.0
var bottom_speed: float = 80.0

#give it a hunting spot
@export var target = Vector2(500, 500)
@onready var plane_im : Sprite2D = $Plane
var start_target : Vector2 
var speed : float
var locked_on : bool = false

var in_one : bool = false
var in_two : bool = false
var in_three : bool = false

#two states patr or hunt
var state : String = "patr"
var circling : bool = false
var radius :int = 150
var angle : float = 0.0
var acceleration : int = 2000

func _ready() -> void:
	start_target = target

func _physics_process(delta: float) -> void:
	
	state = _decide_if_hunting()
	
	if state == "patr":
		_move(delta)
	if state == "hunt":
		_hunt_move(delta)
	



func _move(delta : float):
	var to_target
	
	if not target:
		target = start_target

		return
	
	
	#TODO change this up for actual patroling behaviour
	plane_im.rotation_degrees = 180
	to_target = (target - global_position).angle()

	var current = rotation

	# Smooth rotation toward the target
	rotation = lerp_angle(current, to_target, turn_speed * delta)

	# --- ENGINE SPEED ---
	speed = max_speed 

	# --- MOVE FORWARD IN THE DIRECTION WE'RE FACING ---
	velocity = transform.y * speed
	move_and_slide()
	print("in here")

func _hunt_move(delta : float):
	self.rotation_degrees = target.rotation_degrees
	if circling == false:
		var target_position = target.global_position + Vector2(radius * cos(angle), radius * sin(angle))
		velocity = velocity.move_toward(target_position - global_position, acceleration * delta).normalized() * speed
		move_and_slide()
		if position.distance_to(target.position) < radius:
			circling = true
	else:
		velocity = (self.global_position - target.global_position).normalized().rotated(PI/2) * speed
		move_and_slide()
		if position.distance_to(target.position) > radius:
			circling = false

func _choose_plane_to_hunt(body : Node2D):
	if GameVars.allied_planes.get_child_count() > 0:
		#then hunt a plane
		print("here")
		for p in GameVars.allied_planes.get_children():
			if p.run_away == false:
				target = p
				p.run_away = true
				GameVars.being_persued = false
				break
	else:
		#hunt the player
		target = body
		GameVars.persuer = self
		GameVars.being_persued = true

func _decide_if_hunting() -> String:
	#doing this backwards to give priority to the outside one? not sure if that makes sens
	if GameVars.current_sus >= 2 and in_three == true:

		return "hunt"
	
	if GameVars.current_sus >= 1 and in_two == true:

		return "hunt"
		
	if GameVars.current_sus >= 0 and in_one == true:

		return "hunt"
	
	if target is not Vector2 and is_instance_valid(target): # so its an enemy plane
		return "hunt"
	

	
	return "patr"
#
#
#	Signals
#
#

func _on_plane_area_low_body_entered(body: Node2D) -> void:
	if body.has_method("_bomb"):
		in_one = true 
		if target is CharacterBody2D:
			return
		_choose_plane_to_hunt(body)


func _on_plane_area_mid_body_entered(body: Node2D) -> void:
	if body.has_method("_bomb"):
		in_two = true
	if GameVars.current_sus == 1:
		
		if body.has_method("_bomb"):
			if target is CharacterBody2D:
				return
			_choose_plane_to_hunt(body)


func _on_plane_area_far_body_entered(body: Node2D) -> void:
	if body.has_method("_bomb"):
		in_three = true
		
	if GameVars.current_sus >= 2:
		if body.has_method("_bomb"):
			in_three = true
			if target is CharacterBody2D:
				return
			_choose_plane_to_hunt(body)


func _on_plane_area_low_body_exited(body: Node2D) -> void:
	if body.has_method("_bomb"):
		in_one = false


func _on_plane_area_mid_body_exited(body: Node2D) -> void:
	if body.has_method("_bomb"):
		in_two = false


func _on_plane_area_far_body_exited(body: Node2D) -> void:
	if body.has_method("_bomb"):
		in_three = false
