extends Button

@export var blocks = 3
@export var block_type := 0
@export var block := preload("res://Hazards/hazard.tscn")

func _ready() -> void:
	Events.connect("block_added", _block_added)
	Events.connect("block_deleted", _block_removed)
	
func _block_added() -> void:
	if Events.block_type != block_type:
		return
	blocks -= 1

func _block_removed() -> void:
	if Events.block_type != block_type:
		return
	blocks+=1
