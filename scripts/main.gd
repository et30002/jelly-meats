extends Control



# Menu buttons.
@onready var fullscreen: Button = $OptionsContents/Buttons/Fullscreen
@onready var windowed: Button = $OptionsContents/Buttons/Windowed
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var quit: Button = $Quit
@onready var start: Button = $Start
@onready var options: Button = $Options
@onready var options_contents: Control = $OptionsContents
@onready var back: Button = $Back

# Fade.
var do_fade: bool = true
@onready var menu_fades_in: AnimatedSprite2D = $MenuFadesIn




# Menu Sprites.
@onready var meaty: AnimatedSprite2D = $Meaty
@onready var knife_buttons: AnimatedSprite2D = $KnifeButtons
@onready var knife_back: AnimatedSprite2D = $KnifeBack


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if do_fade:
		menu_fades_in.visible = true
		menu_fades_in.play("default")
		await menu_fades_in.animation_finished
		menu_fades_in.visible = false
		do_fade = false
		
	# Quit game.
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

# Fullscreen.
func _on_fullscreen_pressed() -> void:
	if knife_back.visible:
		audio_stream_player_2d.play()
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

# Windowed.
func _on_windowed_pressed() -> void:
	if knife_back.visible:
		audio_stream_player_2d.play()
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

# Click on quit button.
func _on_quit_pressed() -> void:
	if knife_buttons.visible:
		audio_stream_player.stop()
		get_tree().quit()

# Frame changes for Quit.

func _on_quit_mouse_entered() -> void:
	if knife_buttons.visible:
		meaty.frame = 2
		knife_buttons.frame = 3


func _on_quit_mouse_exited() -> void:
	if knife_buttons.visible:
		knife_buttons.frame = 0


# Press Start.

func _on_start_pressed() -> void:
	if knife_buttons.visible:
		get_tree().change_scene_to_file('res://scenes/level_1.tscn')


func _on_start_mouse_entered() -> void:
	if knife_buttons.visible:
		meaty.frame = 0
		knife_buttons.frame = 1


func _on_start_mouse_exited() -> void:
	if knife_buttons.visible:
		knife_buttons.frame = 0


func _on_options_pressed() -> void:
	if knife_buttons.visible:
		knife_buttons.visible = false
		quit.disabled = true
		start.disabled = true
		options.disabled = true
		quit.visible = false
		start.visible = false
		options.visible = false
		options_contents.visible = true
		knife_back.visible = true
		back.disabled = false
	

func _on_options_mouse_entered() -> void:
	if knife_buttons.visible:
		meaty.frame = 1
		knife_buttons.frame = 2


func _on_back_pressed() -> void:
	if knife_back.visible:
		knife_back.visible = false
		back.disabled = true
		knife_buttons.visible = true
		quit.disabled = false
		start.disabled = false
		options.disabled = false
		quit.visible = true
		start.visible = true
		options.visible = true
		options_contents.visible = false

func _on_back_mouse_entered() -> void:
	knife_back.frame = 1


func _on_back_mouse_exited() -> void:
	knife_back.frame = 0
