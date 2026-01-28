extends Node

#stuff related to the player
#living status
var player_alive : bool = true

#for bombing
var number_of_bombs : int = 5

#for hight
const MAX_HIGHT : int = 3000
const LOWEST_HIGHT : int = 0
const SPEED_LOSE_ALTITUDE : int = 5
var current_hight : int = 3000

#stuf related to the game state
#clock times
var cur_time : int = 1320
const NIGHT_END : int = 360

var night_over : bool = false

#stuff for points
var current_points : int = 0

const SMALL_TARGET : int = 100
