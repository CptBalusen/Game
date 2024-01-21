extends Control

@onready var backButton = $b_BackToMenu
signal sceneChanger(id)

# Called when the node enters the scene tree for the first time.
func _ready():
	backButton.sceneChange.connect(sceneChange)
	pass # Replace with function body.
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func sceneChange(sceneID):
	sceneChanger.emit(sceneID)
	pass
