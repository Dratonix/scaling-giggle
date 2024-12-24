extends Button

class_name  button

@export var blocks : int
@export var scene : PackedScene
@export var block_type : int


func _ready() -> void:
	self.connect("button_down", _button_down)
	
func _button_down() -> void:
	print("Fjajfjlajfksnninjfisnnkajfj")
	if blocks <= 0:
		return
	Events.block_scene = scene
	Events.emit_signal("add_block")
	
		
