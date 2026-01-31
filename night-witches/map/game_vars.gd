extends Node

#stuff related to the overall game
var allied_planes : Node 
var friendly_buildings : Node 
var player : CharacterBody2D 
#stuff related to the player
#living status
var player_alive : bool = true
var player_shot_down : bool = false
var being_persued : bool = false
var persuer 
#for bombing
const MAX_BOMBS : int = 4
var number_of_bombs : int = 4

#for hight
const MAX_HIGHT : int = 3000
const LOWEST_HIGHT : int = 0
const SPEED_LOSE_ALTITUDE : int = 5
var current_hight : int = 3000

#for visibility
const RED : Color = Color(0.947, 0.0, 0.0, 1.0)
const YELLOW : Color = Color(0.847, 0.678, 0.086, 1.0)
const GREY : Color = Color(0.176, 0.161, 0.141, 0.718)

var current_sus : int = 0

#stuf related to the game state
#clock times
var cur_time : int = 1320
const NIGHT_END : int = 360

var night_over : bool = false

#stuff for points
var current_points : int = 0

const SMALL_TARGET : int = 100

func reset():
	"""reset all values to its original point"""
	cur_time = 1320
	night_over = false
	player_alive = true
	player_shot_down = false
	being_persued = false
	persuer = null
	current_points = 0
	current_sus = 0
	current_hight = 3000
	number_of_bombs = 4

var TUTORIAL_INTRO : String = "[center]Comrade, we must all do our part to throw out the invaders".format({})
var TUTORIAL_MOVE : String = "[center]A or D keys to change direction".format({})
var TUTORIAL_SPACE : String = "[center]press SPACE to drop a bomb on a target".format({})
var TUTORIAL_NOISE : String = "[center]be mindful of the noise you make, press E to turn off your engines. Dont fly too low!".format({})
var TUTORIAL_BASE : String = "[center]return to base to collect more bombs and allies".format({})
var TUTORIAL_ALLIES : String = "[center]allies will keep Nazi planes and spotlights off your back".format({})
var TUTORIAL_END : String = "[center]You now know everything you'll need to defend our glorious peoples republic!".format({})

var intro : bool = false
var onto_move : bool = false
var onto_bomb : bool = false
var onto_noise : bool = false
var onto_base : bool = false
var onto_allies : bool = false
var onto_end : bool = false
var move_around : bool = false

func reset_tutorial():
	intro = false
	onto_move = false
	onto_bomb = false
	onto_noise = false
	onto_base = false
	onto_allies = false
	onto_end = false
	move_around = false
