extends KinematicBody2D

var pos
var direction = Vector2(0,0)
var speed = 120
var grid = 32
var moving = false
var world
var destination

func _ready():
	world = get_world_2d().get_direct_space_state()
	set_fixed_process(true)

func _fixed_process(delta):
	
	if (!moving):
		
		if (Input.is_action_pressed("move_up")):
			direction = Vector2(0,-1)
			moving = true
			get_node("Sprite/player_anim").play("walkUp")
			pos = get_pos()
			
		elif (Input.is_action_pressed("move_down")):
			direction = Vector2(0,1)
			moving = true
			get_node("Sprite/player_anim").play("walkDown")
			pos = get_pos()
			
		elif (Input.is_action_pressed("move_right")):
			direction = Vector2(1,0)
			moving = true
			get_node("Sprite/player_anim").play("walkRight")
			pos = get_pos()
			
		elif (Input.is_action_pressed("move_left")):
			direction = Vector2(-1,0)
			moving = true
			get_node("Sprite/player_anim").play("walkLeft")
			pos = get_pos()
		
	else:
		
		destination = world.intersect_ray(get_global_pos(), get_global_pos() + (direction * 2))
		
		if ((get_pos() != pos + direction * grid) and (destination.empty())):
			move(direction.normalized() * speed * delta)
		else:
			moving = false