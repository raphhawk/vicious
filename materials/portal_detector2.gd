extends Area2D
				
				

func _physics_process(delta):
	
	#get_node("../../players/Player2").set_physics_process(false)
	#get_node("../../players/Player2").visible = false
	
	var bodies = get_overlapping_bodies()
	#get_node("../moving_thorns").set_physics_process(false)
	for body in bodies: 
		if  body.name == "Player":
			if not $audportal.is_playing():
				$audportal.play()
			#get_node("../../../../Player").visible = false
			get_node("../../../../Player").position = get_node("../../portal/Position2D").global_position
			#yield(get_tree().create_timer(.5), "timeout")
			#get_node("../../../../Player").visible = true
			
		#if body.name != "Player":
		#	get_node("../moving_thorns").set_physics_process(false)
		#else:
		#	get_node("../moving_thorns").set_physics_process(true)
