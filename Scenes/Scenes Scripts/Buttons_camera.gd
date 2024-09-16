extends CanvasLayer

@onready var arrow_animation = $"Centralized/Arrow Animation"

@onready var workers_text = $"Workers/Workers Text"
@onready var wood_text = $"Wood/Wood Text"
@onready var stone_text = $"Stone/Stone Text"
@onready var food_text = $"Food/Food Text"


func _process(delta):
	workers_text.text = str(GameState.ResourcesManager.worker)
	wood_text.text = str(GameState.ResourcesManager.wood)
	stone_text.text = str(GameState.ResourcesManager.stone)
	food_text.text = str(GameState.ResourcesManager.food)

func _on_left_mouse_touch_pressed():
	GameManager.camera_position.x -= 128

func _on_right_mouse_touch_pressed():
	GameManager.camera_position.x += 128

func _on_up_mouse_touch_pressed():
	GameManager.camera_position.y -= 128

func _on_down_mouse_touch_pressed():
	GameManager.camera_position.y += 128

func _on_centralized_pressed():
	GameManager.camera_position = Vector2(64,64) #create animation?

func _on_centralized_mouse_entered():
	GameManager.moving_camera = true
	arrow_animation.play("focused")

func _on_centralized_mouse_exited():
	GameManager.moving_camera = false
	arrow_animation.play("idle")

func _on_mouse_entered():
	GameManager.moving_camera = true

func _on_mouse_exited():
	GameManager.moving_camera = false

