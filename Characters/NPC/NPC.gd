extends CharacterBody2D

var current_state = IDLE
@export var speed = 30
var dir = Vector2.RIGHT

var start_pos

enum {
	IDLE,
	NEW_DIR,
	MOVE,
	INFECTED
}

func _ready():
	connectInteractionArea()
	add_to_group("NPC")
	randomize()
	start_pos = position

func _process(delta):
	
	match current_state:
		IDLE:
			$AnimatedSprite2D.play("idle")
			pass
		NEW_DIR:
			$AnimatedSprite2D.play("idle")
			dir = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN ])
			pass
		MOVE:
			$AnimatedSprite2D.play("walk")
			move(delta)
			pass

func move(delta):
	position += dir * speed * delta
	# set the ressource of the npc to the direction he is moving to
	#$AnimatedSprite2D.flip_h = !dir.x > 0;
	
	if dir.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif dir.x < 0:
		$AnimatedSprite2D.flip_h = true
		
	# boundaries of the maximum movement square of the npc
	if position.x >= start_pos.x + 20:
		position.x = start_pos.x + 19.9
	elif position.x <= start_pos.x - 20:
		position.x = start_pos.x - 19.9
	elif position.y >= start_pos.y + 20:
		position.y = start_pos.y + 19.9
	elif position.y <= start_pos.y - 20:
		position.y = start_pos.y - 19.9

func choose(array):
	array.shuffle()
	return array.front()

func _on_timer_timeout():
	$Timer.wait_time = choose([0.5, 1, 1.5])
	if (current_state != INFECTED):
		current_state = choose([IDLE, NEW_DIR, MOVE])
	else:
		null
		#Wenn infected, dann infected npc erzeugen.
		#Daten wie Positionm übernehmen und NPC löschen. Zack!

func infect():
	print("hiillffee mama ich bin infiziert")
	current_state = INFECTED
	pass
	
func getCurrentState():
	return current_state
	
func connectInteractionArea():
	$InteractionArea.setCollisionShape($CollisionShape2D.duplicate())
	$InteractionArea.interactionTrigger.connect(interactionMenu)
	
func interactionMenu():
	print("HIER MUSS DU INTERAGIEREN DU HUSO")
