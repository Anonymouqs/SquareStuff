extends _hazard

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var vel: Vector2
var target
var chase:bool = false
var chase_speed:float = 0.02
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if chase:
		self.position = lerp(self.position, target.position, chase_speed)

func _on_Aggression_Area_body_entered(body):
	if body.has_method("player"):
		target = body
		chase = true # Replace with function body.


func _on_Area2D_body_entered(body):
	if chase:
		self.queue_free()
