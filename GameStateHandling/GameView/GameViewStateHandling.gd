extends Node2D

@onready var GameScenes = $Scripts/GameSceneIDS
var childInstance
var childSceneID
var sceneArray = [null, null,null,null,null,null,null]
var savedPackagedSceneArray = [null, null,null,null,null,null,null]

# Called when the node enters the scene tree for the first time.
func _ready():
	var childScene = load("res://UserInterfaces/MainMenue/cs_main_menue.tscn")
	savedPackagedSceneArray[GameScenes.IDs.MainMenu] = childScene
	childInstance = childScene.instantiate()
	add_child(childInstance)
	get_child(1).scene_changer.connect(scene_change)
	childSceneID = 0
	sceneArray[0] = childInstance
	_init_sceneArray()
	pass # Replace with function body.
	
func _init_sceneArray():
	var sceneToAdd
	
	#0 also Main Menu wird in _ready hinzugefügt
	
	sceneToAdd = load("res://UserInterfaces/SettingsMenue/cs_settings.tscn")
	savedPackagedSceneArray[GameScenes.IDs.Settings] = sceneToAdd
	if(sceneToAdd == null):
		print("ERROR IN SCENE ARRAY LOADING SETTINGS")

	
	sceneToAdd = load("res://Level/City1/CityView.tscn")
	savedPackagedSceneArray[GameScenes.IDs.CityView] = sceneToAdd
	if(sceneToAdd == null):
		print("ERROR IN SCENE ARRAY LOADING CITYVIEW")

	
	sceneToAdd = load("res://Buildings/House1/House1Interior.tscn")
	savedPackagedSceneArray[GameScenes.IDs.House1Interior] = sceneToAdd
	if(sceneToAdd == null):
		print("ERROR IN SCENE ARRAY LOADING HOUSE1 INTERIOR")
 
	
	sceneToAdd = load("res://Buildings/House1/House2Interior.tscn")
	savedPackagedSceneArray[GameScenes.IDs.House2Interior] = sceneToAdd
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
	var signalConnectionNeeded = false
	if(sceneArray[sceneID] == null):
		sceneArray[sceneID] = savedPackagedSceneArray[sceneID].instantiate()
		signalConnectionNeeded = true
	if(_check_reset(childSceneID)):
		get_child(1).queue_free()
		sceneArray[childSceneID] = null
	remove_child(get_child(1))
	sceneArray[sceneID].request_ready()
	add_child(sceneArray[sceneID])
	
	if(signalConnectionNeeded):
		get_children()[1].scene_changer.connect(scene_change)
		
	childSceneID = sceneID
	print("ChildScene after Change ", childSceneID)
	pass

