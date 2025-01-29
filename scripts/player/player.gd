extends CharacterBody2D #extends all of the stuff from CharacterBody2D

const SPEED = 120.0
const JUMP_VELOCITY = -300.0  # negative going up for y, positive going down for y. x is normal left right
const FRICTION = 600

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _physics_process(delta: float) -> void: # delta i think is time? not too sure

	handle_jump()
	apply_gravity(delta)
	
	velocity.x = SPEED

	apply_friction(delta)
	move_and_slide() # takes velocity and moves character by that velocity while also colliding (sliding) on static bodies
# move_and_slide multiplies by delta

func apply_gravity(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

func handle_jump():
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY


func apply_friction(delta):
	velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
