extends Area2D
				
				
#onready var anim = get_node("Sprite")
# warning-ignore:unused_argument
func _physics_process(delta):
	#get_node("../mp_lv3").set_physics_process(false)
	#anim.play("off")
	var bodies = get_overlapping_bodies()
	for body in bodies: 
		if  body.name == "Player":	
			set("../Player").position = Vector2(16,2)
			
			
			
			#get_node("../mp_lv4").set_physics_process(true)
			#get_node("../gate_mirrored").gates = "res://src/Levels/lv3b.tscn"
			#get_node("CollisionShape2D").queue_free()
			
			#get_node("../mp_lv3").set_physics_process(true)
			#get_node("../switchdoor").set_physics_process(true)
			#anim.play("on")
			
			
