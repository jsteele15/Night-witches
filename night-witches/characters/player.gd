extends CharacterBody2D

@onready var main : Node2D = self.get_parent()
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var fuel : int = 100
var FUEL_LOSS : int = 1

#for movement
var left : bool = false
var right : bool = false

func _physics_process(delta: float) -> void:
	_move(delta)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left"):
		left = true
	
	if event.is_action_pressed("right"):
		right = true
	
	if event.is_action_pressed("bomb"):
		_bomb()
	
	if event.is_action_released("left"):
		left = false
	
	if event.is_action_released("right"):
		right = false

#
#
#	private functions
#
#

func _move(delta: float):
	#for the rotation
	if right == true and left == true:
		pass
	else:
		#rotate the plane 
		if right == true:
			self.rotation_degrees += 5 
		if left == true:
			self.rotation_degrees -= 5 
	#position += transform.y * SPEED * delta
	velocity = transform.y * SPEED
	move_and_slide()


func _bomb():
	main.building_container.bombing()
