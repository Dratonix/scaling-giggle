extends Hazard

@export var effect : int = 750
@onready var timer2 := $Timer2

var body_

func _on_effect_body_entered(body: Node2D) -> void:
	if body.is_in_group("playe"):
		body.movement_data = load("res://player/slippery_movement.tres")
		

func _on_effect_body_exited(body: Node2D) -> void:
	if body.is_in_group("playe"):
		$Timer2.start(.4)
		body_ = body

func _on_timer_2_timeout() -> void:
	body_.movement_Data = load("res://player/movement/default_movement.tres")
