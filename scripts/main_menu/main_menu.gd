extends Node2D

var songs = [
	"res://assets/audio/F-777 - Dance of The Violins.mp3",
	"res://assets/audio/EVADE FROM 宇宙 - Flyday Chinatown Remix_Instrumental.mp3" 
]

func _ready() -> void:
	var song_to_play = songs[randi() % songs.size()]  # Randomly choose one of the songs
	GameManager.current_level = "res://scenes/main_menu/main_menu.tscn"
	GameManager.player_dead = false
	GameManager.player_won = false
	AudioManager.play_music(song_to_play)

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu/level_select.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_about_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu/about.tscn")
