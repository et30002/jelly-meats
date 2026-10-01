extends Control



# Menu buttons.
@onready var fullscreen: Button = $Buttons/Fullscreen
@onready var windowed: Button = $Windowed
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Start level.
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene_to_file('res://scenes/level_1.tscn')
	
	if audio_stream_player.finished:
		audio_stream_player.play()
	
	# Quit game.
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

# Fullscreen.
func _on_fullscreen_pressed() -> void:
	audio_stream_player_2d.play()
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

# Windowed.
func _on_windowed_pressed() -> void:
	audio_stream_player_2d.play()
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

# Click on quit button.
func _on_quit_pressed() -> void:
	audio_stream_player.stop()
	get_tree().quit()
