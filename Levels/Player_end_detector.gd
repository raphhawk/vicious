extends Area2D


func _physics_process(delta):
	#yield(get_tree().create_timer(.5), "timeout")
	var bodies = get_overlapping_bodies()
	for body in bodies: 		
		if body.name == "Player":
			#yield(get_tree().create_timer(.5), "timeout")
			get_node("../Player").anim.animation = "death2"
			get_node("../Player/jump").stop()
			if Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left"):
				get_node("CollisionShape2D").queue_free()
			
			
		
		
