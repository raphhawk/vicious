extends Area2D

export(String, FILE, "*.tscn") var gates


onready var anim_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies: 
		if body.name == "Player":
			$gearaction.play()
			get_node("../../Player").queue_free()
			anim_player.play("fadein")
			yield(anim_player, "animation_finished")
		
		if get_node("../../switchdoor").position == get_node("../../wp2/Position2D").position:
			get_tree().change_scene("res://src/Levels/lv2a.tscn")
		else:
			get_tree().change_scene(gates)


