extends Node

#Signals
signal add_block
signal dragging
signal drag_ended
signal block_deleted
signal  controller_ended
signal switch_active
#Variabls
@export var block_type : int
@export var block_scene : PackedScene
@export var num_player : int = 0
