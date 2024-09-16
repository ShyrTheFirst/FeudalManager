extends StaticBody2D

@onready var tiles_animations = $TilesAnimations

func _ready():
	tiles_animations.play(GameState.tiles_used[str(position/128)])
