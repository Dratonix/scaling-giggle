extends Node2D

@onready var camera := $Camera2D
@export var players : Array[PackedScene]
@onready var split_screen := $SplitScreen2D
@onready var hazards := $Hazards

@onready var split = $SplitScreen2D
func _ready() -> void:
	Events.connect("add_block", _add_block)
	#Events.connect("controller_ended", control_end)
func control_end() -> void:
	var split = preload("res://split_screen_2d.tscn")
	var Split = split.instantiate()
	for player in players:
		Split.add_player()
	add_child(Split)

func _add_block() -> void:
	var scene = Events.block_scene.instantiate()
	scene.stationary=false
	hazards.add_child(scene)


func _on_button_button_down() -> void:
	Events.emit_signal("controller_ended")
	$CanvasLayer.queue_free()
