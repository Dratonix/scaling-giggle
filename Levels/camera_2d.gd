extends Camera2D

@export var speed := 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_vector = Vector2(Input.get_axis("ui_right", "ui_left"), Input.get_axis("ui_down","ui_up"))
	position += input_vector * delta * speed
	if position.x > 1000:
		position.x = 1000
	
