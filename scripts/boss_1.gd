extends CharacterBody2D

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var color_rect: ColorRect = $ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	#Lower boss health.
	if Input.is_action_just_pressed("attack"):
		progress_bar.set_value_no_signal(progress_bar.value - 10)
	
	# If player wins.
	if progress_bar.value == 0:
		progress_bar.visible = false
		color_rect.visible = false
	
