extends Node2D

func _on_new_game_button_pressed() -> void: # this needs to be changed to start of a new game, so this is currently just a placeholder
	get_tree().change_scene_to_file("res://scenes/world/parallax.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
	
func _on_continue_button_pressed() -> void:
	print("Continue button pressed!")
	get_tree().change_scene_to_file("res://scenes/world/parallax.tscn")
