extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = 0.0
var oldCollider

signal house_collision(id)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	#	if not is_on_floor():
	#	velocity.y += gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		if direction.x > 0:
			$AnimatedSprite2D.flip_h = false
		elif direction.x < 0:
			$AnimatedSprite2D.flip_h = true
			
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
		$AnimatedSprite2D.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		$AnimatedSprite2D.play("idle")

	if move_and_slide():
		if oldCollider != get_slide_collision(0).get_collider():
			house_collision.emit(get_slide_collision(0).get_collider())
			oldCollider = get_slide_collision(0).get_collider()
	else :
		oldCollider = null
		
		
