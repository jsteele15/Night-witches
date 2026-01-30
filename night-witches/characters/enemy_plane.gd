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

func _ready() -> void:
	start_target = target

func _physics_process(delta: float) -> void:
	_move(delta)

func _move(delta : float):
	var to_target
	
	if not target:
		target = start_target
		locked_on = false
		return
	
	if target is not Vector2:
		to_target = (target.global_position - global_position).angle()
		speed = max_speed 
		self.rotation = to_target
		"""
		if locked_on == false:
			if self.rotation_degrees > target.rotation_degrees:
				self.rotation_degrees -= 5
			if self.rotation_degrees < target.rotation_degrees:
				self.rotation_degrees += 5
			if self.rotation_degrees == target.rotation_degrees:
				locked_on = true
		if locked_on == true:
			"""
		#velocity = -transform.y * speed
		var direction = (target.global_position - global_position).normalized()
		velocity = direction * speed
		plane_im.rotation_degrees =  target.rotation_degrees+180
		move_and_slide()
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

func _on_plane_area_low_body_entered(body: Node2D) -> void:
	if body.has_method("_bomb"):
		if target is CharacterBody2D:
			return
		_choose_plane_to_hunt(body)


func _on_plane_area_mid_body_entered(body: Node2D) -> void:
	if GameVars.current_sus == 1:
		if body.has_method("_bomb"):
			if target is CharacterBody2D:
				return
			_choose_plane_to_hunt(body)


func _on_plane_area_far_body_entered(body: Node2D) -> void:
	if GameVars.current_sus >= 2:
		if body.has_method("_bomb"):
			if target is CharacterBody2D:
				return
			_choose_plane_to_hunt(body)
