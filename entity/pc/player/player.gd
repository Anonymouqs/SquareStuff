extends _pc
export var speed = 50
export var accleration = 0.2
export var deceleration = 0.1
export var gravity = 10 #between 1 and 0, uses lerp
export var jump_speed = 175
# Declare member variables here. Examples:

func _ready():
	player_gui_path = get_tree().get_root().find_node("player_gui", true, false)
	pass # Replace with function body.

func player(): #
	pass

func _process(delta) -> void:
	
	#Lateral Movement
	if Input.is_action_pressed("ui_right"): 
		motion.x = lerp(motion.x, speed, accleration)
	elif Input.is_action_pressed("ui_left"):
		motion.x = lerp(motion.x, -speed, accleration)
	else:
		motion.x = lerp(motion.x, 0, deceleration)
	
	#Vertical Movement
	if Input.is_action_just_pressed("ui_up"): #Jump
		motion.y = -jump_speed
	#Gravity
	motion.y += gravity
	motion = controller.move_and_slide(motion)

func disp_level_finished():
	player_gui_path.finish_level()