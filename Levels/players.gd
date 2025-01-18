extends Node2D

var no_move = preload("res://player/movement/no_move.tres")

func _ready() -> void:
	for node in get_children():
		#node.visble = false
#		node.movement = no_move
		break
