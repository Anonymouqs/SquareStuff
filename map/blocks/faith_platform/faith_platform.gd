extends _map

export var rise_speed: float = 0.1
export var reset: bool = false #If true, the platform will not fall back
var rise_pos: Vector2
var start_pos: Vector2
var rise: bool = false #Determines where the object is going

var platform
func _ready():
	platform = get_node("basic_platform")
	rise_pos = get_node("rise_pos").get_position()
	start_pos = platform.get_position()

func _on_Area2D_body_entered(body):
	rise = true

func _on_Area2D_body_exited(body):
	if not reset:
		rise = false

func _physics_process(delta):
	
	
	if rise:
		platform.set_position(lerp(platform.get_position(), rise_pos, rise_speed))
	else:
		platform.set_position(lerp(platform.get_position(), start_pos, rise_speed))