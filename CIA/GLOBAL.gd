extends Node2D

# Declare member variables here.
var score = 0
var motion = Vector2()
var timer : float = 0
var speed = 500
# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	
func _physics_process(delta):
	pass

func mov():
	if Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-20, -speed)
	elif Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+20, speed)
		
	elif Input.is_action_pressed("ui_down"):
		motion.y = max(motion.y+20, speed)
		
	elif Input.is_action_pressed("ui_up"):
		motion.y = min(motion.x-20, -speed)
		
	else:
		motion.x = 0
		motion.y = 0






