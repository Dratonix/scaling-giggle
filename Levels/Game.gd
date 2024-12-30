extends Node

@export var viewport_size = Vector2i(960,540)
@onready var players := {
	"1": {
		container = $HBoxContainer/SubViewportContainer,
		viewport = $HBoxContainer/SubViewportContainer/ViewPort,
		camera = $HBoxContainer/SubViewportContainer/ViewPort/Camera1,
		player = $HBoxContainer/SubViewportContainer/ViewPort/Level1/Player
	},
	"2":
		{
		container = $HBoxContainer/SubViewportContainer2,
		viewport = $HBoxContainer/SubViewportContainer2/ViewPort,
		camera = $HBoxContainer/SubViewportContainer2/ViewPort/Camera2D,
		player = $HBoxContainer/SubViewportContainer/ViewPort/Level1/Player2
		},
	"3":
		{
		container = $HBoxContainer/SubViewportContainer3,
		viewport = $HBoxContainer/SubViewportContainer3/ViewPort,
		camera = $HBoxContainer/SubViewportContainer3/ViewPort/Camera2D,
		player = $HBoxContainer/SubViewportContainer/ViewPort/Level1/Player3
		}
}

func _ready() -> void: 
	viewport_size.x = viewport_size.x / Events.num_player
	match  Events.num_player:
		1:
			print('f')
			players["2"].container.queue_free()
			players["3"].container.queue_free()
			
		2:
			players["2"].viewport.world_2d = players["1"].viewport.world_2d
			players["3"].container.queue_free()
		3:
			players["2"].viewport.world_2d = players["1"].viewport.world_2d
			players["3"].viewport.world_2d  = players["1"].viewport.world_2d
			
	var i = 0
	for node in players.values():
		node.viewport.size = viewport_size
		var remote_transform = RemoteTransform2D.new()
		remote_transform.remote_path = node.camera.get_path()
		node.player.add_child(remote_transform)
		i+=1
		print(node.viewport.size)
