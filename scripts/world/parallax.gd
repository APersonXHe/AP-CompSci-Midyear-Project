extends Node2D

# Called when the node enters the scene tree for the first time.
@onready var collision_polygon_2d: CollisionPolygon2D = $StaticBody2D/CollisionPolygon2D # access to the notes
@onready var polygon_2d: Polygon2D = $StaticBody2D/CollisionPolygon2D/Polygon2D

func _ready():
	polygon_2d.polygon = collision_polygon_2d.polygon # set properties on nodes or get properties on those nodes



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
