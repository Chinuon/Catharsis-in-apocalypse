extends KinematicBody2D

# Declare member variables here. 
onready var motion = GLOBAL.motion
onready var score = GLOBAL.score
onready var timer = GLOBAL.timer
var motion1 = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	
	if Input.is_action_pressed("ui_left"):
		motion1.x = max(motion1.x-20, -500)
		$AnimatedSprite.play("idle")
