extends Hazard


func _on_effect_area_entered(area: Area2D) -> void:
	if area.is_in_group('playe'):
		Events.emit_signal("switch_active")
		print('ffjfjsjsjfks')


func _on_effect_body_entered(body: Node2D) -> void:
	if body.is_in_group('playe'):
		$AnimatedSprite2D.play("default")
		$Timer.start(.5)
		Events.emit_signal("switch_active")
		$CollisionShape2D.disabled=true
		print('ffjfjsjsjfks')



func _on_timer_timeout() -> void:
		$CollisionShape2D.disabled=false
