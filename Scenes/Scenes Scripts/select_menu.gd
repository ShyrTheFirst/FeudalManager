extends Control

var tile_type : String
var focused_tile : Vector2
const TYPE_SELECTION = preload("res://Scenes/type_selection.tscn")
@onready var grid_container = $Panel/GridContainer
const TILES_ANIMATIONS = preload("res://Scenes/tiles_animations.tscn")

func _ready():
	match tile_type:
		"Floresta":
			var create_button1 = TYPE_SELECTION.instantiate()
			create_button1.frame_selection = 3
			create_button1.tip_text = "Sawmill"
			grid_container.add_child(create_button1)

		"Campo":
			var create_button1 = TYPE_SELECTION.instantiate()
			create_button1.frame_selection = 2
			create_button1.tip_text = "House"
			grid_container.add_child(create_button1)

			var create_button2 = TYPE_SELECTION.instantiate()
			create_button2.frame_selection = 1
			create_button2.tip_text = "Defense Tower"
			grid_container.add_child(create_button2)

		"Trigo":
			var create_button1 = TYPE_SELECTION.instantiate()
			create_button1.frame_selection = 4
			create_button1.tip_text = "Farmland"
			grid_container.add_child(create_button1)

		"Rocha":
			var create_button1 = TYPE_SELECTION.instantiate()
			create_button1.frame_selection = 6
			create_button1.tip_text = "Stonemasonry"
			grid_container.add_child(create_button1)

		"Àgua":
			var create_button1 = TYPE_SELECTION.instantiate()
			create_button1.frame_selection = 5
			create_button1.tip_text = "Wharf"
			grid_container.add_child(create_button1)
	
	for button in get_tree().get_nodes_in_group("selection"):
		button.pressed.connect(button_pressed.bind(button))
	
	
	#This type need to be = whatever was created in the tile
	#use that thing with buttons in group to handle input. If button clicked -> spend resource and apply selection
	#create type_selection based on tile type, only show buttons to corresponding type
	#detect resources needed in _process(), change from can't to can apply there.
	#texture of each button and tooltip need to be set from here. We should start small!

func button_pressed(button):
	match button.frame_selection:
		1:
			print("TOWER")
			GameState.tiles_used[str(focused_tile)] = "Torre"
			var animation = TILES_ANIMATIONS.instantiate()
			animation.position = focused_tile * 128
			get_parent().add_child(animation)
			GameState.torres +=1
			get_parent().is_open = false
			queue_free()

		2:
			print("HOUSE")
			GameState.tiles_used[str(focused_tile)] = "Casa"
			var animation = TILES_ANIMATIONS.instantiate()
			animation.position = focused_tile * 128
			get_parent().add_child(animation)
			GameState.casas +=1
			get_parent().is_open = false
			queue_free()

		3:
			print("SAWNMILL")
			GameState.tiles_used[str(focused_tile)] = "Serralheria"
			var animation = TILES_ANIMATIONS.instantiate()
			animation.position = focused_tile * 128
			get_parent().add_child(animation)
			GameState.serralherias +=1
			get_parent().is_open = false
			queue_free()

		4:
			print("FARMLAND")
			GameState.tiles_used[str(focused_tile)] = "Fazenda"
			var animation = TILES_ANIMATIONS.instantiate()
			animation.position = focused_tile * 128
			get_parent().add_child(animation)
			GameState.fazendas +=1
			get_parent().is_open = false
			queue_free()

		5:
			print("WHARF")
			GameState.tiles_used[str(focused_tile)] = "Pier"
			var animation = TILES_ANIMATIONS.instantiate()
			animation.position = focused_tile * 128
			get_parent().add_child(animation)
			GameState.piers +=1
			get_parent().is_open = false
			queue_free()

		6:
			print("STONEMASONRY")
			GameState.tiles_used[str(focused_tile)] = "Alvenaria"
			var animation = TILES_ANIMATIONS.instantiate()
			animation.position = focused_tile * 128
			get_parent().add_child(animation)
			GameState.alvenarias +=1
			get_parent().is_open = false
			queue_free()
