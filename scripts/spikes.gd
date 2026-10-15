extends Area2D



@onready var spikes_sprite: AnimatedSprite2D = $SpikesSprite
@onready var spike_1: CollisionShape2D = $spike1
@onready var spike_2: CollisionShape2D = $spike2
@onready var spike_3: CollisionShape2D = $spike3
@onready var spike_4: CollisionShape2D = $spike4
@onready var spike_5: CollisionShape2D = $spike5

@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	spikes_sprite.frame = 1
	spike_1.disabled = false
	spike_2.disabled = false
	spike_3.disabled = false
	spike_4.disabled = false
	spike_5.disabled = false


func _on_timer_2_timeout() -> void:
	spikes_sprite.frame = 0
	spike_1.disabled = true
	spike_2.disabled = true
	spike_3.disabled = true
	spike_4.disabled = true
	spike_5.disabled = true
	
