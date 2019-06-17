extends _entity
class_name _pc
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var controller_path = ""
export var player_gui_path = ""

var controller: KinematicBody2D
var motion = Vector2(0,0)

func _ready():
	controller = get_node(controller_path)
	pass



func _physics_process(delta):
	motion = controller.move_and_slide(motion, down)
