extends Control

var scene_path := "res://Levels/split_screen_.tscn"
@onready var button4 := $VBoxContainer/Button4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	load_scene()
	#return
func load_scene():
	var new_scene = preload("res://Levels/test_level.tscn")  # Preload the scene
	var new_instance = new_scene.instantiate()  # Instance the scene
	visible=false
	button4.emit_signal("button_down")
	get_parent().add_child(new_instance)  # Add the new scene to the tree
	queue_free()
