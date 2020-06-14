extends Area2D


export(String, FILE, "*.tscn") var gates


#onready var anim_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta):
	#get_node("../hidden_pf6").set_physics_process(false)
	var bodies = get_overlapping_bodies()
	for body in bodies: 
		if body.name == "Player":
			get_node("../../hidden_pf7").set_physics_process(true)
			


