extends Area2D
				
				
#onready var anim = get_node("Sprite")
# warning-ignore:unused_argument
func _physics_process(delta):
	#get_node("../mp_lv3").set_physics_process(false)
#	anim.play("off")
	var bodies = get_overlapping_bodies()
	for body in bodies: 
		if  body.name == "Player":	
			get_node("..").queue_free()
			
