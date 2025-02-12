extends CanvasLayer

@onready var text_label = $VBoxContainer/Text
@onready var menu_button = $VBoxContainer/HBoxContainer/Menu

func _ready() -> void:
	GameManager.player_won = false
	GameManager.player_dead = false
	GameManager.player_paused = false

func _process(delta: float) -> void:
	if GameManager.player_won:
		#print("Player won!")
		AudioManager.play_music("res://assets/audio/DJVI - Cycles_ReducedLength.mp3", true)
	#print("Player won?")

		
func _on_menu_pressed() -> void:
	GameManager.current_level = "res://scenes/main_menu/main_menu.tscn"
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
