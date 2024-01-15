extends Node

@onready var mainChar = get_node("../MainChar")
@onready var buildings = get_node("../Buildings")

# Called when the node enters the scene tree for the first time.
func _ready():
	mainChar.house_collision.connect(_mainchar_collided_with_house)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

# Eventhandling House Collision with MainChar
func _mainchar_collided_with_house(id):
	print(id.name)
	#get_parent().get_parent()._enter_house()
	pass
