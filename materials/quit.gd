extends Button

export(String) var scene_to_load




func _on_quit_button_up():
	get_tree().quit()
