extends Parallax2D

const HOME_SCREEN_SCENE: String = "res://scenes/main_menu/main_menu.tscn"

func _input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):  # Default binding for the Esc key
		get_tree().change_scene_to_file(HOME_SCREEN_SCENE)
