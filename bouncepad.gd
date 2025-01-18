extends Area2D


var body

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("playe"):
		body.bounce = true
		self.body = body
		$Timer.start(2)


func _on_timer_timeout() -> void:
	body.bounce = false
