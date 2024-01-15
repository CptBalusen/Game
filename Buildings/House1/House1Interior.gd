extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Camera2D").make_current();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_text_delete"):
		print(get_parent().name)
		#get_parent()._exit_house()
	pass
