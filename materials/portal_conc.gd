extends Area2D

export(String, FILE, "*.tscn") var gates


#onready var anim_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies: 
		if body.name == "Player":
			if not $audportal.is_playing():
				$audportal.play()
			get_node("../Player").set_physics_process(false)
#			anim_player.play("fadein")
#			yield(anim_player, "animation_finished")
			get_tree().change_scene(gates)
			

