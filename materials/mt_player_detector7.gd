extends Area2D
				
				
#onready var anim = get_node("Sprite")
# warning-ignore:unused_argument
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	get_node("../moving_thorns7").set_physics_process(false)
	for body in bodies: 
		if  body.name == "Player":	
			get_node("../moving_thorns7").set_physics_process(true)
		#if body.name != "Player":
		#	get_node("../moving_thorns").set_physics_process(false)
		#else:
		#	get_node("../moving_thorns").set_physics_process(true)
