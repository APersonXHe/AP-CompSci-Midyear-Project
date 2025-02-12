extends Area2D

@export var speed_increase: float = 50.0 
@onready var sprite: Sprite2D = $Sprite2D 

func _on_body_entered(body):
	print("Body collision detected by speed portal")
	if body.is_in_group("player"):
		body.add_speed(speed_increase) 
		print("Speed increased!")
