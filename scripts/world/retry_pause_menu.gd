extends CanvasLayer

@onready var text_label = $VBoxContainer/Text
@onready var back_button = $VBoxContainer/HBoxContainer/Back
@onready var quit_button = $VBoxContainer/HBoxContainer/Quit

func _ready() -> void:
	update_label_text()
	GameManager.player_dead = false
	GameManager.player_paused = false

func _process(delta: float) -> void:
	update_label_text()
	if GameManager.player_dead:
		# "back" button says "menu" instead
		AudioManager.play_music("res://assets/audio/LEMMiNO - Cipher_ReducedLength.mp3", false)
		back_button.text = "Menu"
	elif GameManager.player_paused:
		# "back" button says "back"
		back_button.text = "Back"


func _on_retry_pressed() -> void:
	print("Pressed retry button")
	print(GameManager.current_level)
	#get_tree().reload_current_scene()
	get_tree().change_scene_to_file(GameManager.current_level)


func _on_back_pressed() -> void:
	#GameManager.current_level = ""
	if GameManager.player_dead:
		print("Back Button pressed: player state = dead")
		get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
	elif GameManager.player_paused:
		print("Back Button pressed: player state = paused")
		self.visible = false
		AudioManager.resume_music()
	#get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")

func update_label_text():
	if GameManager.player_dead:
		text_label.text = "Game Over"
	elif GameManager.player_paused:
		text_label.text = "Paused"
		
func _on_quit_pressed() -> void:
	print("quit button pressed, quitting the game")
	get_tree().quit()
