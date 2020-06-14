extends Area2D
onready var tiles: = get_node(tiles_path)
onready var thorns: = get_node(thorns_path)
export var tiles_path: = NodePath()
export var thorns_path: = NodePath()
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	
	for body in bodies: 
		if  body.name == "Player":	
			tiles.visible = true
			thorns.visible = true
	
