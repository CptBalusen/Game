extends Node2D

var childInstance
var childSceneID
var sceneArray = [null, null,null,null,null,null,null]
var savedPackagedSceneArray = [null, null,null,null,null,null,null]

# Called when the node enters the scene tree for the first time.
func _ready():
	if(get_child_count() > 0):
		print(get_child_count())
		return
	var childScene = load("res://UserInterfaces/MainMenue/cs_main_menue.tscn")
	savedPackagedSceneArray[0] = childScene
	childInstance = childScene.instantiate()
	add_child(childInstance)
	get_child(0).scene_changer.connect(scene_change)
	childSceneID = 0
	_init_sceneArray()
	pass # Replace with function body.
	
func _init_sceneArray():
	sceneArray[0] = childInstance
	var sceneToAdd
	
	sceneToAdd = load("res://UserInterfaces/SettingsMenue/cs_settings.tscn")
	savedPackagedSceneArray[1] = sceneToAdd
	if(sceneToAdd == null):
		print("ERROR IN SCENE ARRAY LOADING SETTINGS")

	
	sceneToAdd = load("res://CityView.tscn")
	savedPackagedSceneArray[2] = sceneToAdd
	if(sceneToAdd == null):
		print("ERROR IN SCENE ARRAY LOADING CITYVIEW")

	
	sceneToAdd = load("res://Buildings/House1/House1Interior.tscn")
	savedPackagedSceneArray[3] = sceneToAdd
	if(sceneToAdd == null):
		print("ERROR IN SCENE ARRAY LOADING HOUSE1 INTERIOR")
 
	
	sceneToAdd = load("res://Buildings/House1/House2Interior.tscn")
	savedPackagedSceneArray[4] = sceneToAdd
	if(sceneToAdd == null):
		print("ERROR IN SCENE ARRAY LOADING HOUSE2 INTERIOR")

	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _check_reset(id):
	match(id):
		0, 1:
			return true
		_:
			return false
	pass

func scene_change(sceneID):
	print("ChildScene before Change ", childSceneID)
	if(sceneArray[sceneID] == null):
		sceneArray[sceneID] = savedPackagedSceneArray[sceneID].instantiate()
	if(sceneArray[sceneID] != null):
		if(_check_reset(childSceneID)):
			get_child(0).queue_free()
			sceneArray[childSceneID] = null
		remove_child(get_child(0))
		sceneArray[sceneID].request_ready()
		add_child(sceneArray[sceneID])
		get_children()[0].scene_changer.connect(scene_change)
	childSceneID = sceneID
	print("ChildScene after Change ", childSceneID)
	pass

