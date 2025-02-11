extends Node2D

# Load the block scene
var block_scene = preload("res://scenes/world/spike.tscn")
@onready var retry_menu = $RetryPauseMenu
@onready var player = $Player

func _ready():  # this is just placeholder code demonstrating how you can code the creation of multiple blocks, such that you don't have to instance them into parallax every time.
	AudioManager.stop_music()
	AudioManager.play_music("res://assets/audio/cYsmix - Babaroque.mp3", false)
	print("Level 1 begun")
	print($RetryPauseMenu)
	print("Retry menu visibility at start:", retry_menu.visible)
	GameManager.player_death.connect(_on_player_died)  # Listen for death signal
	retry_menu.visible = false  # Hide retry menu initially
	print("Retry menu visibility at start after set to false:", retry_menu.visible)
	for i in range(5):  # Create 5 blocks
		var block = block_scene.instantiate()
		block.position = Vector2((i+1) * 100, 160)  # Position them with some space between
		add_child(block)  # Add the block to the scene


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if retry_menu.visible:
		player.set_speed(0)
	else:
		player.set_speed(player.ORIGINALSPEED)
	if Input.is_action_just_pressed("ui_cancel"):  # 'ui_cancel' maps to 'esc' by default in Input Map
		#get_tree().change_scene_to_file("res://scenes/world/retry_pause_menu.tscn")
		#player.set_speed(0)
		GameManager.player_pause.emit()  # Emit the death signal
		GameManager.player_paused = true
		retry_menu.visible = true
	
func go_to_main_menu() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")

func _on_player_died():
	print("Player died - Level1")
	#get_tree().change_scene_to_file("res://scenes/world/retry_pause_menu.tscn")
	#player.set_speed(0)
	retry_menu.visible = true  # Show retry menu
