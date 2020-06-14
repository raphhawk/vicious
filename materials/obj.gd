extends RigidBody2D

var picked = false

func _physics_process(delta):
	
	if picked == true:
		#if not $push.is_playing():
		#	$push.play()
		if get_node("../Player/Position2D"):
			self.position = get_node("../Player/Position2D").global_position
			sleeping = true
		if not get_node("../Player/Position2D"):
			self.position = self.position 
	else:
		sleeping = false
		
	
func _input(event):
	#if $push.is_playing():
	#	$push.stop()
	if Input.is_action_pressed("ui_action") and not Input.is_action_pressed("ui_up"):
		if not Input.is_action_pressed("ui_right") || not Input.is_action_pressed("ui_left"):
			if $push.is_playing():
				$push.stop()
		var bodies = $detector.get_overlapping_bodies()
		for b in bodies:			                          
			if b.name == "Player" and picked == false:
				if Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left"):
					picked = true
					get_node("../Player").input_pickable = false
					get_node("../Player").speed.x = 80
					if not $push.is_playing():
						$push.play()
				
					
				
				
	if Input.is_action_just_released("ui_action") and picked == true:
		picked = false
		if $push.is_playing():
			$push.stop()
		if get_node("../Player/Position2D"):
			get_node_or_null("../Player").speed.x = 150
		if get_node("../Player"):
			get_node("../Player").input_pickable = true 
			if $push.is_playing():
				$push.stop()
		else:
			return
		
