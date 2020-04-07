extends KinematicBody2D
# variables are declare here
## we are using onready has we are loading the varibales from a global script using autolaod in godot
onready var m_speed = GLOBAL.MAX_SPEED
onready var velocity = GLOBAL.velocity
const accel = GLOBAL.ACCELERATION
const fric = GLOBAL.FRICTION
onready var anim := $anim
onready var shape := $CollisionShape2D
onready var animtree = $AnimationTree
onready var animstate = animtree.get("parameters/playback")
#for state machine
enum {
	MOVE,
	ROLL,
	ATTACK
}
var state = MOVE
func _ready():
	animtree.active = true
func _physics_process(delta):
	#match state - which is just like if and elif 
	# we can also use that but we are using it for simplicity
	match state:
		MOVE:
			move_State(delta)
		ROLL:
			roll_State(delta)
		ATTACK:
			attack_State(delta)
func move_State(delta):
	var input_vector = GLOBAL.input_vector
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if input_vector != Vector2.ZERO:
		animtree.set("parameters/Idle/blend_position", input_vector)
		animtree.set("parameters/Run/blend_position", input_vector)
		animtree.set("parameters/Attack/blend_position", input_vector)
		animtree.set("parameters/Roll/blend_position", input_vector)
		animstate.travel("Run")
		velocity += input_vector * accel * delta
		velocity = velocity.clamped(m_speed * delta) 
	else:
		animstate.travel("Idle")
		velocity = GLOBAL.velocity * delta * fric
	move_and_collide(velocity * delta * m_speed)
	if Input.is_action_just_pressed("ui_select"):
		state = ATTACK
	if Input.is_action_just_pressed("Roll"):
		state = ROLL
# to start the attack
func attack_State(delta):
	velocity = Vector2.ZERO
	animstate.travel("Attack")
# to stop the attack
# it is connected to track by using call method
func attack_animation_finished():
	state = MOVE
# to start the roll
func roll_State(delta):
	animstate.travel("Roll")
# to stop the roll state
func roll_animation_finished():
	state = MOVE
