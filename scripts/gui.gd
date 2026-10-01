extends Control



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

	# Lower player health.
	player_health.frame = health_assist - player.health
	
	# Lower boss health.
	progress_bar.set_value_no_signal(boss_1.health)
	
	# If player wins remove progress bar.
	if progress_bar.value == 0:
		progress_bar.visible = false
		
	# If player wins remove boss.
	if progress_bar.value == 0:
		boss_1.visible = false
	
	
	
