extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	# Quit game.
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
