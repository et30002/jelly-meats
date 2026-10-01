extends Area2D

# Get player.
@export var player: CharacterBody2D

# Player inside shape.
var player_in_climb: bool = false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	player_in_climb = true


func _on_body_exited(body: Node2D) -> void:
	player_in_climb = false
