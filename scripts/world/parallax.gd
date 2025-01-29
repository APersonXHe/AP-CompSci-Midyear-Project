extends Node2D

# Load the block scene
var block_scene = preload("res://scenes/world/square_block.tscn")

func _ready():  # this is just placeholder code demonstrating how you can code the creation of multiple blocks, such that you don't have to instance them into parallax every time.
	for i in range(5):  # Create 5 blocks
		var block = block_scene.instantiate()
		block.position = Vector2(i * 100, 200)  # Position them with some space between
		add_child(block)  # Add the block to the scene


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
