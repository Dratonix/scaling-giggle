extends Control


@export var speed := 500
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_vector = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up","ui_down"))
	position += input_vector * delta * speed
	if position.x > 1000:
		position.x = 1000
	

func controller_end() -> void:
	queue_free()


func _on_button_button_down() -> void:
	Events.emit_signal("controller_ended")
	print("fnaum tax")
	queue_free()
