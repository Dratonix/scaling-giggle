extends StaticBody2D
class_name Hazard

@export var grid_size = 32
@export var block_type : int = 0
@export var stationary : bool =false

@onready var timer := $Timer
@onready var raycasts := $Raycasts
@onready var overlap := $Overlap

var rotate := true

enum tile_state{
	DRAGGING,
	FINISHED,
	ENDING
}

var state

func _ready() -> void:
	if !stationary:
		signals()

func _process(delta: float) -> void:
	state_machine()
	if stationary:
		state=tile_state.FINISHED
func set_stats() -> void:
	pass

func state_machine() -> void:
	match state:
		tile_state.DRAGGING:
			Events.emit_signal("dragging")
			var mouse_global_position = get_global_mouse_position()
			var snapped_position = Vector2(round(mouse_global_position.x / grid_size) * grid_size,
								   round(mouse_global_position.y / grid_size) * grid_size)
			position = snapped_position
			
			if Input.is_action_just_pressed("lmb") and verify() and verify_overlap():
				state = tile_state.FINISHED
				Events.emit_signal("block_added")
				Events.block_type=block_type
			
			elif Input.is_action_just_pressed("rmb"):
				Events.emit_signal("drag_ended")
				Events.emit_signal("block_deleted")
				Events.block_type=block_type
				queue_free()
		tile_state.FINISHED:
			Events.emit_signal("drag_ended")
			if raycasts.get_child_count() == 0:
					return
			if raycasts.get_children()[1].is_colliding():
				if raycasts.get_child_count() == 0:
					return
				rotation_degrees=90
			elif  raycasts.get_children()[2].is_colliding():
				if raycasts.get_child_count()==0:
					return
				rotation_degrees=-90
			for raycast in raycasts.get_children():
					raycast.enabled = false
			if Input.is_action_just_pressed("rmb"):
				pass


func signals() -> void:
	set_stats()
	state = tile_state.ENDING
	timer.connect("timeout",_timeout)
	timer.emit_signal("timeout")
func _timeout() -> void:
	state = tile_state.DRAGGING

func verify() -> bool:
	var Raycasts = raycasts.get_children()
	# Loop through all raycasts
	for raycast in Raycasts:
		if raycast.is_colliding():
			var collider = raycast.get_collider()
			
			# Check if the collider is of type 'placeable' (you could use a custom group or a class type check)
#			if "placable" in collider.name:
			return true  # This is a valid placeable object
			print(collider.name)
			# If the collider is of type "Hazard" or "Static", then return false

	# Return false if no valid collision occurred
	return false

func verify_overlap() -> bool:
	var Overlap = overlap.get_overlapping_bodies()
	for body in Overlap:
		if body == self:
			continue
		if body.is_in_group("hazard"):
			return false
	return true
		



func _on_mouse_detector_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and state==tile_state.FINISHED:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			print("something")
			Events.emit_signal("drag_ended")
			Events.emit_signal("block_deleted")
			Events.block_type=block_type
	
			queue_free()
