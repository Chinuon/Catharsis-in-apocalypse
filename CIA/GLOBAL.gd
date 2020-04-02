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







