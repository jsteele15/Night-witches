extends CharacterBody2D

@onready var player : CharacterBody2D 
@onready var plane_image : Sprite2D = $Plane
var speed : float = 300.0
const MAX_SPEED : float = 300.0
const BOTTOM_SPEED : float = 200.0
const RUNNAWAY_SPEED : float = 350.0
const RUN_RANGE : int = 1000
var left : bool = false
var right : bool = false
var engine_on : bool = true
var run_away : bool = false


func _ready() -> void:
	player = self.get_parent().get_parent().player
	GameVars.allied_planes = self.get_parent()
	
func _physics_process(delta: float) -> void:
	if player != null:
		_move(delta)
		_change_hight()
		
	if player == null:
		player = self.get_parent().get_parent().player
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left"):
		left = true
	
	if event.is_action_pressed("right"):
		right = true
	
	
	if event.is_action_released("left"):
		left = false
	
	if event.is_action_released("right"):
		right = false
	
	if event.is_action_pressed("engine"):
		if engine_on == true:
			engine_on = false
		else:
			engine_on = true

#
#
#	private functions
#
#

func _move(delta: float):
	#for the rotation
	
	if run_away == true:
		#enemy plane comes into attack, then leave
		#self.get_parent().remove_child(self)
		if self.rotation_degrees > -45:
			self.rotation_degrees -= 5
		if self.rotation_degrees < -45:
			self.rotation_degrees += 5
			
		velocity = transform.y * speed
		move_and_slide()
		#put the kill plane thing here for expediency
		_kill_plane()
	else:
		self.rotation_degrees = player.rotation_degrees
		
		#TODO lerp through these
		if engine_on == true:
			speed = MAX_SPEED
		else:
			speed = BOTTOM_SPEED
			
		velocity = transform.y * speed
		move_and_slide()

func _kill_plane():
	"""workout distance between the player, if its a great distance queue free"""
		
	if global_position.distance_to(player.global_position) > RUN_RANGE:
		self.get_parent().remove_child(self)
		self.queue_free()

func _change_hight():
	plane_image.scale = player.plane_image.scale
