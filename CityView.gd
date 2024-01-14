extends Node2D

@onready var camera = $playerViewCam
@onready var player = $MainChar

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	setCamera()
	pass

func setCamera():
	var interface = $Interface;
	camera.set_position(player.get_position())
	pass
