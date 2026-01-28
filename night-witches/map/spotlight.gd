extends CharacterBody2D

var plane_entered : bool = false
var starting_point : Vector2

func _input(event: InputEvent) -> void:
	starting_point = self.global_position

func _physics_process(delta: float) -> void:
	_move_spotlight(delta)

#
#
#	private functions
#
#

func _move_spotlight(delta: float):
	"""i guess move the spotlight back and fourth between two positions
	unless the players in it, in which case follow it"""

func _on_spotlight_area_body_entered(body: Node2D) -> void:
	if body.has_method("_bomb"):
		print("plane entered")
		plane_entered = true


func _on_spotlight_area_body_exited(body: Node2D) -> void:
	if body.has_method("_bomb"):
		print("plane entered")
		plane_entered = false
