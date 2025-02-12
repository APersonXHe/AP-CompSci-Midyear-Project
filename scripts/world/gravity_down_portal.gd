extends Area2D

@export var new_gravity_direction: Vector2 = Vector2.DOWN  # Default gravity is down
@onready var sprite: Sprite2D = $Sprite2D

# Triggering the gravity change when the player enters the area
func _on_body_entered(body):
	if body.is_in_group("player"):
		print("Gravity portal activated!")
		body.set_gravity_direction(new_gravity_direction) 
