extends Node2D
#global variables
# note script name is GLOBAL but we can also change to any other name
var velocity = Vector2.ZERO
var input_vector = Vector2.ZERO
const MAX_SPEED = 200
const ACCELERATION = 5
const FRICTION = 40
var inputkey_pressed = false
