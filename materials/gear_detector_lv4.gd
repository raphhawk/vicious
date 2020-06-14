extends Area2D


#export(String, FILE, "*.tscn") var gates




func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies: 
		if body.name == "Player":
			get_node("../gear1").set_physics_process(true)
			
