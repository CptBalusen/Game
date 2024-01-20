extends Node2D


signal scene_changer(id)

@onready var camera = $playerViewCam
@onready var player = $MainChar
@onready var backButton = camera.get_node("Interface/backToMenu")


# Called when the node enters the scene tree for the first time.
func _ready():
	backButton.scene_change.connect(_scene_change)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	setCamera()
	pass

func setCamera():
	#var interface = $Interface;
	camera.set_position(player.get_position())
	pass

func _scene_change(id):
	scene_changer.emit(id)
	pass
