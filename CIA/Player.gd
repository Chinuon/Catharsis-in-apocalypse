extends KinematicBody2D
onready var m_speed = GLOBAL.MAX_SPEED
onready var velocity = GLOBAL.velocity
const accel = GLOBAL.ACCELERATION
const fric = GLOBAL.FRICTION
onready var anim := $anim
onready var shape := $CollisionShape2D
onready var animtree = $AnimationTree
onready var animstate = animtree.get("parameters/playback")
enum {
	MOVE,
	ROLL,
	ATTACK
}
var state = MOVE
func _ready():
	animtree.active = true
func _physics_process(delta):
	match state:
		MOVE:
			move_State(delta)
		ROLL:
			pass
		ATTACK:
			attack_State(delta)
	move_State(delta)
func move_State(delta):
	var input_vector = GLOBAL.input_vector
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if input_vector != Vector2.ZERO:
		animtree.set("parameters/Idle/blend_position", input_vector)
		animtree.set("parameters/Run/blend_position", input_vector)
		animstate.travel("Run")
		velocity += input_vector * accel * delta
		velocity = velocity.clamped(m_speed * delta) 
	else:
		animstate.travel("Idle")
		velocity = GLOBAL.velocity * delta * fric
	move_and_collide(velocity * delta * m_speed)
	if Input.is_action_just_pressed("attack"):
		state = ATTACK
func attack_State(delta):
	pass
	
