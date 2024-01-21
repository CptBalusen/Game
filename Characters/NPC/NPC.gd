extends CharacterBody2D

class_name NPC

var Infected_NPCScene
var current_state = IDLE
@export var speed = 30
@export var isChased: bool = false
var dir = Vector2.RIGHT

var start_pos

enum {
	IDLE,
	NEW_DIR,
	MOVE,
	INFECTED
}

func _ready():
	add_to_group("NPC")
	randomize()
	start_pos = position
	Infected_NPCScene = preload("res://Characters/NPC/Infected_NPC/Infected_NPC.tscn")

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
		var oInfected_NPC = Infected_NPCScene.instantiate()
		oInfected_NPC.set_position(get_position())
		get_parent().add_child(oInfected_NPC)
		queue_free()
		visible = false
		pass
		

func infect():
	print("hiillffee mama ich bin infiziert")
	current_state = INFECTED
	pass
	
func getCurrentState():
	return current_state
