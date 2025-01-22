extends CharacterBody2D #extends all of the stuff from CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0  # negative going up for y, positive going down for y. x is normal left right

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"): # ui_accept is the space key
		# if add and is_on_floor() to the if statement, can only jump when on floor
		velocity.y = JUMP_VELOCITY # which is -300

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
