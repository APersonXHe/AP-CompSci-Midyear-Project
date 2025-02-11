extends Area2D

signal player_death

func _ready():
	pass

func _on_body_entered(body):
	if body.is_in_group("player"):  # Ensure the player is in the "player" group
		print("Player died lol")
		GameManager.player_death.emit()  # Emit the death signal
		GameManager.player_dead = true
		#get_tree().paused = true
