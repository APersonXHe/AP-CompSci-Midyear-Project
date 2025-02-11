extends Node2D

func _on_level_1_pressed() -> void:
	GameManager.current_level = "res://scenes/levels/level1.tscn"
	get_tree().change_scene_to_file("res://scenes/levels/level1.tscn")


func _on_level_2_pressed() -> void:
	GameManager.current_level = "res://scenes/levels/level2.tscn"
	get_tree().change_scene_to_file("res://scenes/levels/level2.tscn")
	

func _on_level_3_pressed() -> void:
	GameManager.current_level = "res://scenes/levels/level3.tscn"
	get_tree().change_scene_to_file("res://scenes/levels/level3.tscn")


func _on_back_pressed() -> void:
	GameManager.current_level = "res://scenes/main_menu/main_menu.tscn"
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
