extends Node2D

# Declare member variables here.
var velocity = Vector2.ZERO
var input_vector = Vector2.ZERO
const MAX_SPEED = 200
const ACCELERATION = 10
const FRICTION = 400
# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	pass







