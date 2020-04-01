extends KinematicBody2D

# Declare member variables here. 
onready var motion = GLOBAL.motion
onready var score = GLOBAL.score
onready var timer = GLOBAL.timer
onready var speed = GLOBAL.speed

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	
	if Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-20, -speed)
		
	elif Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+20, speed)
		



		
	move_and_slide(motion)
