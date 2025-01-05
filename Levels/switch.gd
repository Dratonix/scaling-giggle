extends TileMapLayer

@export var coll : bool

func _ready() -> void:
	Events.connect("switch_active",switch_active)
	collision_enabled=coll
func switch_active() -> void:
	visible=!visible
	collision_enabled=false
