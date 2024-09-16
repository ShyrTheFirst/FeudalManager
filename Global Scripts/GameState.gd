extends Node

var ResourcesManager : Manager = preload("res://Global Scripts/Manager.tres")

var tiles_type : Dictionary = {}
var tiles_used : Dictionary = {}

var time_to_tick : float = 0.0
var tick_time : int = 10
var tick : bool = false

var casas : int = 0
var torres : int = 0
var serralherias : int = 0
var fazendas : int = 0
var piers : int = 0
var alvenarias : int = 0


func _process(delta):
	if time_to_tick < tick_time:
		tick = false
		time_to_tick += delta
	else:
		tick = true
		time_to_tick = 0.0
	
	if tick:
		print("+1") #create animation showing how much is adding
		print(casas)

