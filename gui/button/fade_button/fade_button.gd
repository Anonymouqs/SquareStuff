extends Button
onready var animation_tree = get_node("AnimationTree")
export var blend_speed = 0.1
var add = true #If true, it will move blend label to 1, if false, it will move 1dblend to -1

func _on_Button_mouse_entered() -> void:
	add = false


func _on_Button_mouse_exited() -> void:
	add = true


func _process(delta):
	if add == true:
		animation_tree["parameters/blend_position"] = lerp(animation_tree["parameters/blend_position"], 1, blend_speed)
	else:
		animation_tree["parameters/blend_position"] = lerp(animation_tree["parameters/blend_position"], -1, blend_speed)