extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func disp_score(scorenum):
	$VBoxContainer/score.text = "Score: " + convert(scorenum, TYPE_STRING)

func disp_lives(livesnum):
	$VBoxContainer/health.text = "Lives: " + convert(livesnum, TYPE_STRING)

func finish_level():
	var scene = load("res://gui/player/level_finished/level_finished.tscn")
	var finish_gui = scene.instance()
	add_child(finish_gui)