extends Node2D

@onready var red_obstacle = $VBoxContainer/BeatObstacleRed
@onready var orange_obstacle = $VBoxContainer/BeatObstacleOrange
@onready var green_obstacle = $VBoxContainer/BeatObstacleGreen
@onready var cyan_obstacle = $VBoxContainer/BeatObstacleCyan

@onready var vboxcontainer = $VBoxContainer
@onready var spawntimer = $SpawnTimer

@export var scroll_speed: float = 200.0
@export var spawn_interval: float = 1.0

func _ready():
	# i'm trying to use this timer to handle spawning of tiles
	spawntimer.wait_time = spawn_interval
	spawntimer.start()

func _process(delta):
	# for each type of tile, duplicate it
	for tile in vboxcontainer.get_children():
		var obstacle = tile.duplicate()
		obstacle.position.x -= scroll_speed * delta
		if obstacle.position.x < -50:
			obstacle.queue_free()

func _on_SpawnTimer_timeout():
	# add the duplicated tile to the tree
	var obstacle = red_obstacle.duplicate() # just red obstacle for now
	obstacle.position = Vector2(600, 300)
	add_child(obstacle)
