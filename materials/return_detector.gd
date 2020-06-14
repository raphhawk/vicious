extends Area2D


func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies: 
		if body.name == "Player":
			get_node("../Player").speed.x = 150
			get_node("../Player").speed.y = 500
		
		
