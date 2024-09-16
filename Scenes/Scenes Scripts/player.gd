extends CharacterBody2D

@onready var camera = $Camera2D


func _ready():
	position = GameManager.camera_position

func _process(delta):
	position = GameManager.camera_position

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 5 and camera.zoom > Vector2(0.5,0.5):
			camera.zoom -= Vector2(0.1,0.1) #max -> 0.4
		elif event.button_index == 4 and camera.zoom < Vector2(1.5,1.5):
			camera.zoom += Vector2(0.1,0.1) #max -> 1.4
