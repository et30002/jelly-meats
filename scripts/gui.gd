extends Control

# Pause Menu.
@onready var knife_back_pause: AnimatedSprite2D = $KnifeBackPause
@onready var pause_menu: Sprite2D = $PauseMenu
@onready var back_button: Button = $BackButton
@onready var quitto_menu: Button = $QuittoMenu
@onready var exit_to_menu: AnimatedSprite2D = $ExitToMenu


# Lose Screen.
@onready var losescreen: Sprite2D = $Losescreen

# Win Screen.
@onready var winscreen: Sprite2D = $Winscreen

# Get player.
@export var player: CharacterBody2D

# Get boss_1.
@export var boss_1: Area2D

# Get acid pool.
@export var acid_pool: Area2D

# Boss health progress bar variable.
@onready var progress_bar: ProgressBar = $ProgressBar

# Get player health GUI.
@onready var player_health: AnimatedSprite2D = $PlayerHealth

# Health assist variable.
var health_assist: float = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:



	if player.health == 0:
		losescreen.visible = true



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
	player_health.frame = health_assist - player.health
	
	# Lower boss health.
	progress_bar.set_value_no_signal(boss_1.health)
	
	# If player wins remove progress bar & boss and display win screen.
	if progress_bar.value == 0:
		
		progress_bar.visible = false
		boss_1.visible = false
		winscreen.visible = true

	
	


func _on_back_button_pressed() -> void:
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
	
	get_tree().paused = false
	get_tree().change_scene_to_file('res://scenes/main.tscn')


func _on_quitto_menu_mouse_entered() -> void:
	exit_to_menu.frame = 1


func _on_quitto_menu_mouse_exited() -> void:
	exit_to_menu.frame = 0
