extends Area2D

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies: 
		if body.name == "Player":
			get_node("../hider_lv4").set_physics_process(true)
			get_node("CollisionShape2D").queue_free()
		#	get_node("../../hider_lv44").speed = 150.0
