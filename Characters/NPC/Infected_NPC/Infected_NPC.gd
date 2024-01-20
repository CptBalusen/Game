extends CharacterBody2D

class_name Infected_NPC

@onready var nav: NavigationAgent2D = $NavigationAgent2D

var speed = 50
var accel = 7

var chasedNPC: NPC

func _ready():
	add_to_group("Infected_NPC")

func _process(delta):
	var results: Array
	
	CityView.findNPCs(get_parent(), results)
	
	if (!results.is_empty()):
		chaseNPC(delta)
	else:
		idle()
	pass

func choose(array):
	array.shuffle()
	return array.front()

func chaseNPC(delta):
	var direction = Vector3()
	var npc_position = Vector3()
	
	$AnimatedSprite2D.play("walk")
	
	#get the nearest npc pos
	npc_position = getNearestNpcPosition()
	nav.target_position = npc_position
	
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed, accel * delta)
	
	move_and_slide()

func getNearestNpcPosition() -> Vector2:
	var results: Array
	var closest_npc = null
	var closest_npc_distance = 0.0
	
	CityView.findNPCs(get_parent(), results)
	
	for npc in results:
		var current_npc_distance = get_position().distance_to(npc.global_position)
		if (closest_npc == null or current_npc_distance < closest_npc_distance and !npc.isChased):
			closest_npc = npc
			closest_npc_distance = current_npc_distance
	
	if closest_npc != null:
		chasedNPC = closest_npc
		chasedNPC.isChased = true
		return chasedNPC.get_position()
	else:
		return get_position()
		
func idle():
	$AnimatedSprite2D.play("idle")
	pass
	
