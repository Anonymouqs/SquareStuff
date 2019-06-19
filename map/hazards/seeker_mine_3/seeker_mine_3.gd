extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var vel: Vector2
export var acceleration:float = 5
export var max_velocity:float = 200
var target
var chase:bool = false
var chase_speed:float = 0.02
var motion:Vector2 = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _physics_process(delta):
	if chase:
		var delta_position = target.position - self.position
		pursue(atan2(delta_position.x, delta_position.y))
		motion = move_and_slide(motion)
		print(target.position)
		#find angle between target
		#accelerate towards target
		#Calculate Motion

func pursue(angle): #Accellerate towards the object
	var max_vel = Vector2(max_velocity*cos(angle), max_velocity*sin(angle))
	if motion.x < max_vel.x:
		motion.x += acceleration
	if motion.y < max_vel.y:
		motion.y += acceleration
	
func _on_Aggression_Area_body_entered(body):
	if body.has_method("player"):
		target = body
		chase = true 


func _on_Area2D_body_entered(body):
	if chase:
		self.queue_free()
