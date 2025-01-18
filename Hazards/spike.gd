extends Hazard


func _on_effect_body_entered(body: Node2D) -> void:
	if body.is_in_group('playe'):
		body.reset()
