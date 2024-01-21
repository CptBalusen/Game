class_name cInteractionArea
extends Area2D
signal interactionTrigger

func interact():
	interactionTrigger.emit()
	
func setCollisionShape(parentCollision):
	print(parentCollision)
	$CollisionShape2D.replace_by(parentCollision)
	$CollisionShape2D.set_scale(Vector2(2, 2))

