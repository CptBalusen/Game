extends Control

@onready var settingsButton = $b_OpenSettings
@onready var startButton = $b_StartGame
signal sceneChanger(id)

# Called when the node enters the scene tree for the first time.
func _ready():
	settingsButton.sceneChange.connect(sceneChange)
	startButton.sceneChange.connect(sceneChange)
	pass # Replace with function body.
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func sceneChange(sceneID):
	sceneChanger.emit(sceneID)
	pass
