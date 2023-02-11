extends KinematicBody2D

var pos
var moving = false
var action = 0
var grid = 32
var speed = 120
var direction = Vector2(0,0)
var timer = 0

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	
	timer += delta
	
	if (timer >= 1):
		
		if (!moving):
			
			action = randi()%5+1
			
			if (action == 1):
				direction = Vector2(0,-1)
				get_node("npc_sprite/moving_npc_anim").play("walkUp")
				pos = get_pos()
				moving = true
			elif (action == 2):
				direction = Vector2(0,1)
				get_node("npc_sprite/moving_npc_anim").play("walkDown")
				pos = get_pos()
				moving = true
			elif (action == 3):
				direction == Vector2(-1,0)
				get_node("npc_sprite/moving_npc_anim").play("walkLeft")
				pos = get_pos()
				moving = true
			elif (action == 4):
				direction == Vector2(1,0)
				get_node("npc_sprite/moving_npc_anim").play("walkRight")
				pos = get_pos()
				moving = true
			
		else:
		
			if (get_pos() != pos + direction * grid):
				move(direction.normalized() * speed * delta)
			else:
				moving = false
				timer = 0

