extends CanvasLayer

@onready var text_label = $VBoxContainer/Text

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_label_text()
	GameManager.player_dead = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_retry_pressed() -> void:
	#get_tree().reload_current_scene()
	get_tree().change_scene_to_file("res://scenes/levels/level1.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")

func update_label_text():
	if GameManager.player_dead:
		text_label.text = "Better Luck Next Time"
	else:
		text_label.text = "Paused"
