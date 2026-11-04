extends Area2D


# Ham variables.
@onready var ham: Area2D = $"."
@onready var hamsprite: AnimatedSprite2D = $hamsprite
@onready var hamcollider: CollisionShape2D = $hamcollider
var hamhealth: float = 3
# Get player.
@export var player: CharacterBody2D
var insideham: bool = false



func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if hamhealth == 0:
		hamsprite.play("hamdeath")
		await hamsprite.animation_finished
		
		# get rid of ham
		hamsprite.visible = false
		hamcollider.disabled = true


func _on_body_entered(body: Node2D) -> void:
	if body == player:
		insideham = true

func _on_body_exited(body: Node2D) -> void:
	if body == player:
		insideham = false
