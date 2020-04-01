extends Node2D

# Declare member variables here.
var score = 0
var motion = Vector2()
var timer : float = 0
var speed = 500
var friction = false


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	set_process(true)

func _process(delta):

	if friction == true:
		motion.x = 0


