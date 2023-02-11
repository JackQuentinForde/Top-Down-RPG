extends Sprite

func _ready():
	
	if (get_frame() == 0 or get_frame() == 1):
		get_node("stationary_npc_anim").play("walkDown")
		
	elif (get_frame() == 2 or get_frame() == 3):
		if (is_flipped_h()):
			get_node("stationary_npc_anim").play("walkLeft")
		else:
			get_node("stationary_npc_anim").play("walkRight")
			
	elif (get_frame() == 4 or get_frame() == 5):
		get_node("stationary_npc_anim").play("walkUp")
