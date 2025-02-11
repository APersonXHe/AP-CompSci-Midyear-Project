extends StaticBody2D

func _ready():
	draw_rect(Rect2(Vector2.ZERO, Vector2(32, 128)), Color(1, 0, 0, 0))
	
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 3
	timer.one_shot = true 
	timer.connect("timeout", _on_timeout) 
	timer.start()

func _on_timeout():
	queue_free()  
