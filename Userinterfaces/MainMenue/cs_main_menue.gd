extends Control

@onready var settingsButton = $b_OpenSettings
@onready var startButton = $b_StartGame
signal scene_changer(id)

# Called when the node enters the scene tree for the first time.
func _ready():
	settingsButton.scene_change.connect(_scene_change)
	startButton.scene_change.connect(_scene_change)
	pass # Replace with function body.
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _scene_change(sceneID):
	scene_changer.emit(sceneID)
	pass
