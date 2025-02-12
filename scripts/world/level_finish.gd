extends Area2D

signal player_victory

func _ready():
	pass

func _on_body_entered(body):
	if body.is_in_group("player"):  # Ensure the player is in the "player" group
		print("Player finished the level!")
		GameManager.player_victory.emit()  # Emit the victory signal
		GameManager.player_won = true
		#get_tree().paused = true
