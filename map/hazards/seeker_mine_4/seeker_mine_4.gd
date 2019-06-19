extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var vel: Vector2
export var acceleration:float = 5
export var max_velocity:float = 105
export var damage: int = 20
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
		pursue(atan2(-delta_position.y, delta_position.x))
		motion = move_and_slide(motion)
		
		#find angle between target
		#accelerate towards target
		#Calculate Motion

func pursue(angle): #Accellerate towards the object
	var max_vel = Vector2(max_velocity*cos(angle), -max_velocity*sin(angle))
	print(max_vel)
	if max_vel.x > 0:
		if motion.x < max_vel.x:
			motion.x += acceleration*cos(angle)
	else:
		if motion.x > max_vel.x:
			motion.x += acceleration*cos(angle)
	if max_vel.y > 0:
		if motion.y < max_vel.y:
			motion.x += acceleration*cos(angle)
	else:
		if motion.y > max_vel.y:
			motion.y += acceleration*cos(angle)
	
	motion.y += -acceleration*sin(angle)
	
func _on_Aggression_Area_body_entered(body):
	if body.has_method("player"):
		target = body
		chase = true 



func _on_hit_detection_body_entered(body):
	if chase:
		if body.has_method("player"):
			body.health -= damage
		self.queue_free()