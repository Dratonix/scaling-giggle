extends Node

@export var viewport_size = Vector2i(1200,540)
@onready var players := {
	"1": {
		container = $SubViewportContainer,
		viewport = $SubViewportContainer/ViewPort,
		camera = $SubViewportContainer/ViewPort/Camera1,
		player = $SubViewportContainer/ViewPort/Level1/Player
	},
	"2":
		{
		container = $SubViewportContainer2,
		viewport = $SubViewportContainer2/ViewPort,
		camera = $SubViewportContainer2/ViewPort/Camera2D,
		player = $SubViewportContainer/ViewPort/Level1/Player2
		},
	"3":
		{
		container = $SubViewportContainer3,
		viewport = $SubViewportContainer3/ViewPort,
		camera = $SubViewportContainer3/ViewPort/Camera2D,
		player = $SubViewportContainer/ViewPort/Level1/Player3
		}
}

func _ready() -> void: 
	#viewport_size.x /= Events.num_player
	match  Events.num_player:
		1:
			print('f')
			players["1"].viewport_size=Vector2i(viewport_size.x/2,viewport_size.y/2);
			#players["2"].container.queue_free()
			#players["3"].container.queue_free()
			
		2:
			players["2"].viewport.world_2d = players["1"].viewport.world_2d
			#players["3"].container.queue_free()
		3:
			players["2"].viewport.world_2d = players["1"].viewport.world_2d
			players["3"].viewport.world_2d  = players["1"].viewport.world_2d
			players["1"].viewport_size=Vector2i(viewport_size.x/2,viewport_size.y/2);
			players["2"].viewport_size=Vector2i(viewport_size.x/2,viewport_size.y/2);
			players["2"].viewport_size=Vector2i(viewport_size.x,viewport_size.y/2);

	var i = 0
	for node in players.values():
	#	node.viewport.size = viewport_size
		var remote_transform = RemoteTransform2D.new()
		remote_transform.remote_path = node.camera.get_path()
		node.player.add_child(remote_transform)
		i+=1
		print(node.viewport.size)


func _on_button_button_down() -> void:
	$Control.queue_free()
	$HBoxContainer.visible=true

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		Events.num_player = 3
		viewport_size = Vector2(960,540)
		_ready()
