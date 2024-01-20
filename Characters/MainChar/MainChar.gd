extends CharacterBody2D

var playerCoughScene
var oPlayerCough

const SPEED = 300.0
const JUMP_VELOCITY = 0.0
const ACCELERATION = 500
const FRICTION = 2500
var oldCollider

@onready var speechBubble = preload("res://Userinterfaces/SpeechBubble/speechBubble.tscn")

signal house_collision(id)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	connectInteractionArea()
	add_to_group("MainChar")
	playerCoughScene = preload("res://Characters/MainChar/playerCough.tscn")
	set_process_input(true)
	pass

func _physics_process(delta):
	var input = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	player_movement(input, delta)
	move_and_slide()

func player_movement(input, delta):
	if input: 
		#movement
		if input.x > 0:
			$AnimatedSprite2D.flip_h = false
		elif input.x < 0:
			$AnimatedSprite2D.flip_h = true
		velocity = velocity.move_toward(input * SPEED , delta * ACCELERATION)
		$AnimatedSprite2D.play("walk")
	else: 
		#no movement
		velocity = velocity.move_toward(Vector2(0,0), delta * FRICTION)
		$AnimatedSprite2D.play("idle")

func _input(event):
	if event is InputEventKey and event.is_pressed():
		match event.keycode:
			KEY_H:
				#cough
				createPlayerCough()
			KEY_F:
				#Interaction
				checkInteraction()
				
	pass

func createPlayerCough():
	if !oPlayerCough:
		oPlayerCough = playerCoughScene.instantiate()
		add_child(oPlayerCough)
		$Timer.start(1)
		
	#oPlayerCough.set_position(get_position())
	#create a timer for playerCough to delete it after 2 seconds or smthng like that
	pass
	
func checkInteraction():
	var listOfAreas = $InteractionArea.get_overlapping_areas()
	for i in listOfAreas:
		var closestInteraction = null
		if i is cInteractionArea:
			i.interact()

func connectInteractionArea():
	$InteractionArea.setCollisionShape($CollisionShape2D.duplicate())
	$InteractionArea.interactionTrigger.connect(interactionMenu)
	
func _on_Cough_timeout():
	if oPlayerCough:
		oPlayerCough.queue_free()
		oPlayerCough = null
	pass # Replace with function body.

func interactionMenu():
	pass
