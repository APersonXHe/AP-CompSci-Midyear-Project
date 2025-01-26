extends CharacterBody2D #extends all of the stuff from CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0  # negative going up for y, positive going down for y. x is normal left right
const ACCELERATION = 600
const FRICTION = 600

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _physics_process(delta: float) -> void: # delta i think is time? not too sure

	handle_jump()
	
	var input_axis := Input.get_axis("ui_left", "ui_right")
	handle_acceleration(input_axis, delta)
	apply_friction(input_axis, delta)
	move_and_slide() # takes velocity and moves character by that velocity while also colliding (sliding) on static bodies
# move_and_slide multiplies by delta

func apply_gravity(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

func handle_jump():
	if is_on_floor(): # different heights in jumps depending on how long space bar is held down
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY

	else:
		if Input.is_action_just_released("ui_accept") and velocity.y < 0:
			velocity.y = JUMP_VELOCITY/3.5

func apply_friction(input_axis, delta):
	if input_axis == 0:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)

func handle_acceleration(input_axis, delta):
	if input_axis != 0:
		velocity.x = move_toward(velocity.x, SPEED*input_axis, ACCELERATION*delta)
