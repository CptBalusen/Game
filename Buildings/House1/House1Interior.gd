extends Node2D

@onready var spawnPoint = $SpawnPoint
signal sceneChanger(id)

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Camera2D").make_current();
	child_entered_tree.connect(mainCharEnteredTree)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_text_delete"):
		print(get_child_count())
		#get_parent()._exit_house()
	pass
	
func sceneChange(id):
	sceneChanger.emit(id)
	pass

func mainCharEnteredTree(node):
	print(node.name)
	if node.name == "MainChar":
		node.set_position(spawnPoint.get_position())
