extends Hazard


func _on_effect_area_entered(area: Area2D) -> void:
	if area.is_in_group('playe'):
		Events.emit_signal("switch_active")
		print('ffjfjsjsjfks')


func _on_effect_body_entered(body: Node2D) -> void:
	if body.is_in_group('playe'):
		Events.emit_signal("switch_active")
		print('ffjfjsjsjfks')
