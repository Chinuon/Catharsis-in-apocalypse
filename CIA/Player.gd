extends KinematicBody2D
onready var m_speed = GLOBAL.MAX_SPEED
onready var velocity = GLOBAL.velocity
const accel = GLOBAL.ACCELERATION
const fric = GLOBAL.FRICTION
onready var animationPlayer = $AnimationPlayer
func _ready():
	set_physics_process(true)
	set_process(true)
func _process(delta):
	pass
func _physics_process(delta):
	var input_vector = GLOBAL.input_vector
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if input_vector != Vector2.ZERO:
		animationPlayer.play("RunRight")
		velocity += input_vector * accel * delta
		velocity = velocity.clamped(m_speed * delta) 
	else:
		animationPlayer.play("IdleRight")
		velocity = GLOBAL.velocity * delta * fric
	move_and_collide(velocity * delta * m_speed)
	

