extends Area2D
				
				
onready var anim = get_node("Sprite")
# warning-ignore:unused_argument
func _physics_process(delta):
	anim.play("off")
	var bodies = get_overlapping_bodies()
	for body in bodies: 
		if  body.name == "Player" and Input.is_action_pressed("ui_action"):	
			if not $audswitch.is_playing():
				$audswitch.play()
			get_node("../switchdoor").set_physics_process(true)
			anim.play("on")
			#if $audswitch.is_playing():
			#	$audswitch.stop()
