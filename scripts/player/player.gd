extends CharacterBody2D #extends all of the stuff from CharacterBody2D

const ORIGINALSPEED = 120.0
const JUMP_VELOCITY = -300.0  # negative going up for y, positive going down for y. x is normal left right
const FRICTION = 600

var speed = ORIGINALSPEED
var start_position : Vector2

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	start_position = position
	
func _physics_process(delta: float) -> void: # delta i think is time? not too sure

	handle_jump()
	apply_gravity(delta)
	
	velocity.x = speed

	apply_friction(delta)
	move_and_slide() # takes velocity and moves character by that velocity while also colliding (sliding) on static bodies
	#if is_on_spike():
		#reset_game()
# move_and_slide multiplies by delta


func apply_gravity(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
 
func handle_jump():
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY


func apply_friction(delta):
	velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
	
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

func set_speed(new_speed):
	speed = new_speed
