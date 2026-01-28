extends CharacterBody2D

@onready var player : CharacterBody2D 
@onready var plane_image : Sprite2D = $Plane
var speed : float = 300.0
const MAX_SPEED : float = 300.0
const BOTTOM_SPEED : float = 200.0
var left : bool = false
var right : bool = false
var engine_on : bool = true
var run_away : bool = false
func _ready() -> void:
	player = self.get_parent().get_parent().player
	
func _physics_process(delta: float) -> void:
	_move(delta)
	
	#super fucking dirty implementation but itll do i guess
	if player != null:
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
		pass
	else:
		if right == true and left == true:
			pass
		else:
			#rotate the plane 
			if right == true:
				self.rotation_degrees += 5 
			if left == true:
				self.rotation_degrees -= 5 
		
		#TODO lerp through these
		if engine_on == true:
			speed = MAX_SPEED
		else:
			speed = BOTTOM_SPEED
			
		velocity = transform.y * speed
		move_and_slide()

func _change_hight():
	plane_image.scale = player.plane_image.scale
