extends Node

#stuff related to the player
#living status
var player_alive : bool = true

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
