extends Node2D

class_name CityView


signal sceneChanger(id)

@onready var camera = $playerViewCam
@onready var player = $MainChar
@onready var backButton = camera.get_node("Interface/backToMenu")
@onready var buildingParent = $Buildings


# Called when the node enters the scene tree for the first time.
func _ready():
	backButton.sceneChange.connect(sceneChange)
	
	var buildings = buildingParent.get_children()
	for i in buildings:
		if i.has_method("sceneChange"):
			i.sceneChange.connect(sceneChange)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	setCamera()
	pass

func setCamera():
	#var interface = $Interface;
	camera.set_position(player.get_position())
	pass

func sceneChange(id):
	sceneChanger.emit(id)
	pass
	
static func findNPCs(node: Node, result : Array) -> void:
	if node is NPC:
		result.push_back(node)
	for child in node.get_children():
		findNPCs(child, result)
