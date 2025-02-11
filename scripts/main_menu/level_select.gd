extends Node2D

func _on_level_1_pressed() -> void:
	TransitionManager.transition()
	TransitionManager.on_transition_finished.connect(_change_scene_1)


func _on_level_2_pressed() -> void:
	TransitionManager.transition()
	TransitionManager.on_transition_finished.connect(_change_scene_2)
	

func _on_level_3_pressed() -> void:
	TransitionManager.transition()
	TransitionManager.on_transition_finished.connect(_change_scene_3)
	

func _change_scene_1():
	GameManager.current_level = "res://scenes/levels/level1.tscn"
	get_tree().change_scene_to_file("res://scenes/levels/level1.tscn")
	

func _change_scene_2():
	GameManager.current_level = "res://scenes/levels/level2.tscn"
	get_tree().change_scene_to_file("res://scenes/levels/level2.tscn")
	

func _change_scene_3():
	GameManager.current_level = "res://scenes/levels/level3.tscn"
	get_tree().change_scene_to_file("res://scenes/levels/level3.tscn")


func _on_back_pressed() -> void:
	GameManager.current_level = "res://scenes/main_menu/main_menu.tscn"
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
