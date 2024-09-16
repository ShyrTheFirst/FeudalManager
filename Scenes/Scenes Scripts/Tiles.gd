extends TileMap

const SELECT_MENU = preload("res://Scenes/select_menu.tscn")
const OBJECT_MENU = preload("res://Scenes/object_menu.tscn")

@export var grid_size : int = 32 #use it in GameState? Or keep here with export?
#use it in GameState v?
var initial_tiles : Dictionary = { 
	str(Vector2(0,0)):"Campo", str(Vector2(0,1)):"Campo", str(Vector2(1,0)):"Campo", str(Vector2(1,1)):"Campo",
	str(Vector2(-1,0)):"Campo", str(Vector2(-1,-1)):"Campo", str(Vector2(-1,0)):"Campo", str(Vector2(-1,1)):"Campo",
	str(Vector2(1,-1)):"Campo", str(Vector2(0,-1)):"Campo"}

var mouse_focus : Vector2
var is_open : bool = false

#CREATE REFERENCE TO EACH TILE ATLAS COORD AND SOURCE ID? Just to help me make changes
#When a place is created, create an animation in that said sprite? instantiate a scene with animated sprite or
#give a texture and use animation player? Remember that mouse_focus * 128 = tile place
#make all math inside GameState!!!! Each new place adds up to a variable there, that'll make the counting
#Pause the animation when the player os far? Create a menu with option to stop animations anyways.
#How much lag will it generate to have all tiles animated?
#Create some kind of background? Like an empty space kind?
#How will I handle large maps? Limit size or chunk load? I'll start limiting and see where it goes


func _ready():
	randomize()
	for x in range(-grid_size, grid_size):
		for y in range(-grid_size, grid_size):
			if GameManager.tutorial:
				if initial_tiles.has(str(Vector2(x,y))):
					GameState.tiles_type[str(Vector2(x,y))] = initial_tiles[str(Vector2(x,y))]
					set_cell(0, Vector2(x,y), 1, Vector2(0,0), 0)
					set_cell(1,Vector2(x,y), 1, Vector2(5,0), 0)
				else:
					var rand_gen = randi_range(0,4)
					match rand_gen:
						0:
							GameState.tiles_type[str(Vector2(x,y))] = "Campo"
							set_cell(0, Vector2(x,y), 1, Vector2(0,0), 0)
							set_cell(1,Vector2(x,y), 1, Vector2(5,0), 0)
						1:
							GameState.tiles_type[str(Vector2(x,y))] = "Trigo"
							set_cell(0, Vector2(x,y), 1, Vector2(1,0), 0)
							set_cell(1,Vector2(x,y), 1, Vector2(5,0), 0)
						2:
							GameState.tiles_type[str(Vector2(x,y))] = "Floresta"
							set_cell(0, Vector2(x,y), 1, Vector2(2,0), 0)
							set_cell(1,Vector2(x,y), 1, Vector2(5,0), 0)
						3:
							GameState.tiles_type[str(Vector2(x,y))] = "Rocha"
							set_cell(0, Vector2(x,y), 1, Vector2(3,0), 0)
							set_cell(1,Vector2(x,y), 1, Vector2(5,0), 0)
						4:
							GameState.tiles_type[str(Vector2(x,y))] = "Àgua"
							set_cell(0, Vector2(x,y), 1, Vector2(4,0), 0)
							set_cell(1,Vector2(x,y), 1, Vector2(5,0), 0)
			else:
				var rand_gen = randi_range(0,4)
				match rand_gen:
					0:
						GameState.tiles_type[str(Vector2(x,y))] = "Campo"
						set_cell(0, Vector2(x,y), 1, Vector2(0,0), 0)
						set_cell(1,Vector2(x,y), 1, Vector2(5,0), 0)
					1:
						GameState.tiles_type[str(Vector2(x,y))] = "Trigo"
						set_cell(0, Vector2(x,y), 1, Vector2(1,0), 0)
						set_cell(1,Vector2(x,y), 1, Vector2(5,0), 0)
					2:
						GameState.tiles_type[str(Vector2(x,y))] = "Floresta"
						set_cell(0, Vector2(x,y), 1, Vector2(2,0), 0)
						set_cell(1,Vector2(x,y), 1, Vector2(5,0), 0)
					3:
						GameState.tiles_type[str(Vector2(x,y))] = "Rocha"
						set_cell(0, Vector2(x,y), 1, Vector2(3,0), 0)
						set_cell(1,Vector2(x,y), 1, Vector2(5,0), 0)
					4:
						GameState.tiles_type[str(Vector2(x,y))] = "Àgua"
						set_cell(0, Vector2(x,y), 1, Vector2(4,0), 0)
						set_cell(1,Vector2(x,y), 1, Vector2(5,0), 0)

func _process(_delta):
	mouse_focus = local_to_map(get_global_mouse_position())
	for x in range(-grid_size, grid_size):
		for y in range(-grid_size, grid_size):
			set_cell(1,Vector2(x,y), 1, Vector2(5,0), 0)

	if GameState.tiles_type.has(str(mouse_focus)) and !GameManager.moving_camera:
		set_cell(1,mouse_focus, 1, Vector2(6,0), 0)
		for node in get_tree().get_nodes_in_group("menu"):
			if node.position != mouse_focus * 128:
				is_open = false
				node.queue_free()
			
			if node.position == mouse_focus *128:
				is_open = true

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == 1 and !GameManager.moving_camera and not is_open:
	
			if GameState.tiles_used.has(str(mouse_focus)):
				var open_menu = OBJECT_MENU.instantiate()
				#give info about the tile being clicked -> 
				#open_menu.get_info(tiles_used[str(mouse_focus)])
				#Show info about that tile and construction
				open_menu.position = mouse_focus * 128
				add_child(open_menu)
	
			elif GameState.tiles_type.has(str(mouse_focus)):
				var open_menu = SELECT_MENU.instantiate()
				open_menu.tile_type = GameState.tiles_type[str(mouse_focus)]
				open_menu.focused_tile = mouse_focus
				open_menu.position = mouse_focus * 128
				add_child(open_menu)
				
