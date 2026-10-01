extends Node2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Loop the audio.
	#if audio_stream_player.finished:
		#audio_stream_player.play()

	# Quit game.
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
