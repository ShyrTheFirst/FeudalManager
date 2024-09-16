extends Button

@onready var sprite = $Sprite
var frame_selection : int = 0
var tip_text : String

#frame_selection :
	#0 - castle -> nothing yet
	#1 - tower -> nothing yet
	#2 - house -> worker
	#3 - sawmill -> wood
	#4 - farmland -> food(wheat)
	#5 - wharf -> food(fish)
	#6 - stonemasonry -> rock

func _ready():
	tooltip_text = tip_text
	sprite.frame = frame_selection

