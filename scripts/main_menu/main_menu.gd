extends Node2D

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu/level_select.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_about_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu/level_select.tscn")
