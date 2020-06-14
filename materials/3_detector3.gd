extends Area2D
onready var tiles: = get_node(tiles_path)
onready var tiles2: = get_node(tiles2_path)
onready var thorns: = get_node(thorns_path)
onready var hider: = get_node(hider_path)
export var tiles_path: = NodePath()
export var tiles2_path: = NodePath()
export var thorns_path: = NodePath()
export var hider_path: = NodePath()
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	
	for body in bodies: 
		if  body.name == "Player":	
			tiles.visible = true
			tiles2.visible = true
			thorns.visible = true
			hider.set_physics_process(true)
	
