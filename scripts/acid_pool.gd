extends Area2D

# Get player.
@export var player: CharacterBody2D

# Timer value.
var timer_total: float = 100

# Time when player gets hurt.
var delta_freeze: float = 0

# Player is in acid.
var player_in_acid: bool = false

# Wait for timer.
var hurt_player: bool = true

# Timer value differences.
var timer_difference: float = 0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Hurt player.
	if player_in_acid == true:
		player.health = player.health - 1
		
		
		
		#if hurt_player == true:
			#player.health = player.health - 1
			#delta_freeze = delta
			#hurt_player = false
			#
		#timer_difference = delta - delta_freeze
		#
		#if hurt_player == false && timer_difference == delta_freeze:
			#hurt_player = true
	

# If player lands in acid.
func _on_body_entered(body: Node2D) -> void:
	if body == player:
		player_in_acid = true

# If player leaves acid.
func _on_body_exited(body: Node2D) -> void:
		if body == player:
			# Player is not in acid.
			player_in_acid = false
			#
			## Reset timer.
			#delta_freeze = 0
			#timer_difference = 0
			#
