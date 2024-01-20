extends Area2D

class_name MainChar

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_body_entered (oNode2d):
	if !oNode2d:
		return
		
	var groups = oNode2d.get_groups()
	for group in groups:
		if group == "NPC":
			oNode2d.infect()
	
func _on_body_exited(oNode2D):
	pass
