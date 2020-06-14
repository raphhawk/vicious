extends Button

#func _ready():
#	self.grab_focus()
func _input(event):	
	if Input.is_action_just_pressed("ui_cancel"):
			get_tree().change_scene("res://src/Levels/titlescreen.tscn")

func _on_Button_button_up():
	get_tree().change_scene("res://src/Levels/titlescreen.tscn")
	
