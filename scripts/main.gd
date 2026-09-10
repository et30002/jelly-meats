extends Control



@onready var fullscreen: Button = $Buttons/Fullscreen
@onready var windowed: Button = $Windowed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Start level.
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene_to_file('res://scenes/level_1.tscn')
	
	# Quit game.
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

# Volume slider.

# Fullscreen.
func _on_fullscreen_pressed() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func _on_windowed_pressed() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

# Click on quit button.
func _on_quit_pressed() -> void:
	get_tree().quit()
