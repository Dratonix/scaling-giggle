extends Node2D


func _ready() -> void:
	Events.connect("add_block", _add_block)
func _add_block() -> void:
	var scene = Events.block_scene.instantiate()
	print(Events.block_scene.resource_name)
	add_child(scene)
