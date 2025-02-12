extends CharacterBody2D

var ORIGINALSPEED = 120.0
const JUMP_VELOCITY = -300.0  # negative going up for y, positive going down for y. x is normal left right
const FRICTION = 600

var speed = ORIGINALSPEED
var speed_before_pause = speed
var start_position : Vector2

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity_direction = Vector2.DOWN  # Default gravity direction

const JUMP_BUFFER_TIME = 0.1  # Time window to buffer jump input
const COYOTE_TIME = 0.1       # Time window for "coyote jump" after falling

var jump_buffer_timer = 0.0
var coyote_timer = 0.0
var has_jumped = false  # Track if the player has already jumped

func _ready():
	start_position = position

func _physics_process(delta: float) -> void:
	# Update timers
	if jump_buffer_timer > 0:
		jump_buffer_timer -= delta
	if (gravity_direction == Vector2.DOWN and is_on_floor()) or (gravity_direction == Vector2.UP and is_on_ceiling()):
		coyote_timer = COYOTE_TIME  # Reset coyote timer when on the correct surface
		has_jumped = false
	else:
		coyote_timer -= delta


	handle_jump()
	apply_gravity(delta)

	velocity.x = speed
	apply_friction(delta)
	move_and_slide()

func apply_gravity(delta):
	# Apply gravity in the direction specified by gravity_direction
	if gravity_direction == Vector2.DOWN:
		velocity.y += gravity * delta  # Pull down
	elif gravity_direction == Vector2.UP:
		velocity.y -= gravity * delta  # Push up
	elif gravity_direction == Vector2.LEFT:
		velocity.x -= gravity * delta  # Pull left
	elif gravity_direction == Vector2.RIGHT:
		velocity.x += gravity * delta  # Push right

func handle_jump():
	# Handle jump input buffering
	if Input.is_action_just_pressed("ui_accept"):
		jump_buffer_timer = JUMP_BUFFER_TIME

	# Allow jumping if buffered jump is still valid and within coyote time
	if (jump_buffer_timer > 0 or (Input.is_action_pressed("ui_accept")) or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)) and coyote_timer > 0 and not has_jumped:
		if gravity_direction == Vector2.DOWN:
			velocity.y = JUMP_VELOCITY
		elif gravity_direction == Vector2.UP:
			velocity.y = -JUMP_VELOCITY
		jump_buffer_timer = 0.0  # Reset jump buffer
		has_jumped = true  # Mark that the player has jumped

func apply_friction(delta):
	# Apply friction on the x-axis
	velocity.x = move_toward(velocity.x, speed, FRICTION * delta)
	
"""
func is_on_spike() -> bool:
	# Check for collision with spikes
	var collision = get_slide_collision(0)
	if collision:
		var collider = collision.get_collider()
		# If the player collides with a spike, return true
		if collider and collider.name == "spike":
			print("Collision with spike detected")
			return true
	return false
"""

# Reset the game and respawn the player at the start position
func reset_game():
	# You can reset the player position here
	position = start_position
	# Optionally, reset the background or other game elements
	# get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")

func add_speed(more_speed):
	print("Adding speed: ", more_speed)
	speed += more_speed
	speed_before_pause = speed
	print("New speed after adding: ", speed) 

func set_speed(new_speed):
	print("Setting new speed: ", new_speed) 
	speed = new_speed
	speed_before_pause = speed
	print("New speed set to: ", speed) 

func freeze():
	velocity = Vector2.ZERO  # Stop all movement
	speed = 0  # Prevent movement updates
	set_process(false)  # Disable _process (stops input handling)
	set_physics_process(false)  # Disable physics updates (stops gravity/jump)
	
func unfreeze():
	speed = speed_before_pause  # Restore movement
	set_process(true)  # Re-enable input handling
	set_physics_process(true)  # Re-enable physics

func set_gravity_direction(new_gravity_direction):
	gravity_direction = new_gravity_direction
