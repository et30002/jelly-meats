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

# speed
var speed: float = 1
var doublespeed: float = 2
var sinkspeed: float = 40

# SFX
@onready var boss_audio: AudioStreamPlayer2D = $BossAudio
@onready var player_hurt_audio: AudioStreamPlayer2D = $PlayerHurtAudio

var boss_audio_done: bool = false
var hurt_audio_done: bool = false 



# Turn around.
#var go_right: bool = false
#var go_left: bool = true


# Is knife attacking?
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
	

	if spawn_in == false:
		animated_sprite.visible = false
	elif spawn_in == true:
		animated_sprite.visible = true
		if is_attacking == false:
			if boss_1.global_position.y >= -900:
				boss_1.global_position.y -= sinkspeed
			if player.global_position.x < boss_1.global_position.x:
				boss_1.global_position.x -= speed
			elif player.global_position.x > boss_1.global_position.x:
				boss_1.global_position.x += speed
		elif is_attacking == true:
			if boss_1.global_position.y < -200:
				boss_1.global_position.y += sinkspeed
		
	#if is_attacking == false:
		#boss_1.monitorable = true
	#else:
		#boss_1.monitorable = false

	if health <= 250:
		animated_sprite.frame = 1
		half_health = true
		speed = doublespeed


# If player is attacking over boss.
func _on_body_entered(body: Node2D) -> void:
	if body == player:
		if player_in_range == true && is_attacking == true:
			player.health -= 1


func _on_body_exited(body: Node2D) -> void:
	if body == player:
		player_in_range = false


func _on_timer_timeout() -> void:
	is_attacking = true
	player_in_range = true


func _on_ablity_done_timeout() -> void:
	is_attacking = false
	player_in_range = false
