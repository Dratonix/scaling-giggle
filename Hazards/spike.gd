extends Hazard


func _on_effect_body_entered(body: Node2D) -> void:
	if body.get_groups()[0] == "playe":
		body.position = body.starting_position
