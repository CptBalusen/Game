extends Control

@onready var backButton = $b_BackToMenu
signal scene_changer(id)

# Called when the node enters the scene tree for the first time.
func _ready():
	backButton.scene_change.connect(_scene_change)
	pass # Replace with function body.
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _scene_change(sceneID):
	scene_changer.emit(sceneID)
	pass
