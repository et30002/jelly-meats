extends Area2D


@onready var boss_1: Area2D = $"."


@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

# Animated sprite.
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Get player.
@export var player: CharacterBody2D

# Boss health value.
var health: float = 500
var half_health: bool = false

# Is player in range?
var player_in_range: bool = false

# Turn around.
var go_right: bool = false
var go_left: bool = true
var is_attacking: bool = false

var spawn_in: bool = false
var start_fight: bool = true

@onready var timer: Timer = $Timer
@onready var ablity_done: Timer = $AblityDone




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if spawn_in == true:
		if is_attacking == false:
			if health <= 250:
				animated_sprite.play("mad")
				half_health = true
			else:
				animated_sprite.play("idle")
			if boss_1.global_position.x <= -500:
				go_left = false
				go_right = true
				#animated_sprite.flip_h = true
			elif boss_1.global_position.x >= 640:
				go_left = true
				go_right = false
				#animated_sprite.flip_h = false
			
			if go_left == true:
				if half_health == false:
					boss_1.global_position.x -= 5
				if half_health == true:
					boss_1.global_position.x -= 10
			elif go_right == true:
				if half_health == false:
					boss_1.global_position.x += 5
				if half_health == true:
					boss_1.global_position.x += 10
			


# If player is attacking over boss.
func _on_body_entered(body: Node2D) -> void:
	if body == player:
		player_in_range = true
		if is_attacking == false && spawn_in == true:
			player.health -= 1


func _on_body_exited(body: Node2D) -> void:
	if body == player:
		player_in_range = false


func _on_timer_timeout() -> void:
	is_attacking = true
	animated_sprite.play("fall")


func _on_ablity_done_timeout() -> void:
	is_attacking = false
