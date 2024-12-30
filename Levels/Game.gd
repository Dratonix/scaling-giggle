extends Node

@export var viewport_size = Vector2i(960,540)
@onready var players := {
	"1": {
		viewport = $HBoxContainer/SubViewportContainer/ViewPort,
		camera = $HBoxContainer/SubViewportContainer/ViewPort/Camera1,
		player = $HBoxContainer/SubViewportContainer/ViewPort/Level1/Player
	},
	"2":
		{
		viewport = $HBoxContainer/SubViewportContainer2/ViewPort,
		camera = $HBoxContainer/SubViewportContainer2/ViewPort/Camera2D,
		player = $HBoxContainer/SubViewportContainer/ViewPort/Level1/Player2
		},
	"3":
		{
		viewport = $HBoxContainer/SubViewportContainer3/ViewPort,
		camera = $HBoxContainer/SubViewportContainer3/ViewPort/Camera2D,
		player = $HBoxContainer/SubViewportContainer/ViewPort/Level1/Player3
		}
}

func _ready() -> void: 
	viewport_size.x = viewport_size.x / Events.num_player
	match  Events.num_player:
		2:
			players["2"].viewport.world_2d = players["1"].viewport.world_2d
			players["2"].viewport.size = viewport_size
			players["1"].viewport.size = viewport_size
	var i = 0
	for node in players.values():
		
		var remote_transform = RemoteTransform2D.new()
		remote_transform.remote_path = node.camera.get_path()
		node.player.add_child(remote_transform)
		print(node.player)
		i+=1
	print(viewport_size)
