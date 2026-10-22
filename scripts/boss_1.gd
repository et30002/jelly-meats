extends Area2D


@onready var boss_1: Area2D = $"."


@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

# Animated sprite.
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Get player.
@export var player: CharacterBody2D

# Boss health value.
var health: float = 1000

# Is player in range?
var player_in_range: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	boss_1.global_position.x -= 1
	animated_sprite.play("idle")

	
	# Play boss idle.
	#animated_sprite.play("idle")


# If player is attacking over boss.
func _on_body_entered(body: Node2D) -> void:
	if body == player:
		player_in_range = true


func _on_body_exited(body: Node2D) -> void:
	if body == player:
		player_in_range = false


func _on_timer_timeout() -> void:
	animated_sprite.play("fall")
