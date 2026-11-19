extends Control


# Rumble.
@onready var rumble_sound: AudioStreamPlayer2D = $RumbleSound


# Pause Menu.
@onready var menu_button_click: AudioStreamPlayer2D = $MenuButtonClick
@onready var knife_back_pause: AnimatedSprite2D = $KnifeBackPause
@onready var pause_menu: Sprite2D = $PauseMenu
@onready var back_button: Button = $BackButton
@onready var quitto_menu: Button = $QuittoMenu
@onready var exit_to_menu: AnimatedSprite2D = $ExitToMenu

# Back to menu button.
@onready var return_to_menu: Button = $ReturnToMenu

# Lose Screen.
@onready var losescreen: Sprite2D = $Losescreen

# Win Screen.
@onready var winscreen: Sprite2D = $Winscreen

# Get player.
@export var player: CharacterBody2D

# Camera variable.
@onready var camera_2d: Camera2D = $"../Player/Camera2D"

# Get boss_1.
@export var boss_1: Area2D

# Get little_boss.
@export var little_boss: Area2D

# Get spikes.
@export var spikes: Area2D

# Boss health progress bar variable.
@onready var progress_bar: ProgressBar = $ProgressBar

# Get player health GUI.
@onready var player_health: AnimatedSprite2D = $PlayerHealth

# Health assist variable.
var health_assist: float = 3

# Get ham.
@export var ham: Area2D

# Fades.
@onready var fade_in: AnimatedSprite2D = $FadeIn
@onready var fade_out: AnimatedSprite2D = $FadeOut

# Red flash.
@onready var red_flash: AnimatedSprite2D = $RedFlash

# Shake timer.
@onready var shake_screen_timer: Timer = $ShakeScreenTimer
var stop_shake: float = 60
var start_timer: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:


	if ham.hamhealth == 0:
		progress_bar.visible = true
	else:
		progress_bar.visible = false

	if ham.hamhealth == 0:
		stop_shake -= 1
		if stop_shake > 0:
			camera_2d.apply_shake()
			if camera_2d.shake_strength > 0:
				camera_2d.shake_strength = lerpf(camera_2d.shake_strength, 0, camera_2d.shakeFade * delta)
				camera_2d.offset = camera_2d.randomOffset()
		else:
			boss_1.spawn_in = true
	

	if player.health == 0:
		losescreen.visible = true
		return_to_menu.visible = true
		get_tree().paused = true
		#get_tree().paused = true



# Pause menu
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = true
		back_button.disabled = false
		back_button.visible = true
		knife_back_pause.visible = true
		pause_menu.visible = true
		quitto_menu.disabled = false
		exit_to_menu.visible = true

	# Lower player health.
	if health_assist - player.health == 0:
		player_health.play("three")
	elif health_assist - player.health == 1:
		player_health.play("two")
	elif health_assist - player.health == 2:
		player_health.play("one")
	else:
		player_health.play("none")
		
	#player_health.frame = health_assist - player.health
	
	# Lower boss health.
	if boss_1.spawn_in == true:
		progress_bar.set_value_no_signal(boss_1.health)
	
	# If player wins remove progress bar & boss and display win screen.
	if progress_bar.value == 0:
		player_health.visible = false
		progress_bar.visible = false
		boss_1.visible = false
		winscreen.visible = true
		return_to_menu.visible = true
		get_tree().paused = true
		#get_tree().paused = true

	
	


func _on_back_button_pressed() -> void:
	menu_button_click.play()
	get_tree().paused = false
	back_button.disabled = true
	back_button.visible = false
	knife_back_pause.visible = false
	pause_menu.visible = false
	quitto_menu.disabled = true
	exit_to_menu.visible = false


func _on_back_button_mouse_entered() -> void:
	knife_back_pause.frame = 1


func _on_back_button_mouse_exited() -> void:
	knife_back_pause.frame = 0


func _on_quitto_menu_pressed() -> void:
	menu_button_click.play()
	get_tree().paused = false
	get_tree().change_scene_to_file('res://scenes/main.tscn')


func _on_quitto_menu_mouse_entered() -> void:
	exit_to_menu.frame = 1


func _on_quitto_menu_mouse_exited() -> void:
	exit_to_menu.frame = 0


func _on_return_to_menu_pressed() -> void:
	menu_button_click.play()
	get_tree().paused = false
	get_tree().change_scene_to_file('res://scenes/main.tscn')
	
	
func _on_spikes_body_entered(body: Node2D) -> void:
	if body == player:
		player.health = player.health - 1
	pass


func _on_shake_screen_timer_timeout() -> void:
	pass
