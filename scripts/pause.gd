extends Control


@onready var back: Button = $Back
@onready var knife_back: AnimatedSprite2D = $KnifeBack
@onready var pause_background: AnimatedSprite2D = $PauseBackground
@onready var menu_items: Control = $MenuItems




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		menu_items.visible = true
	


func _on_back_pressed() -> void:
	menu_items.visible = false


func _on_back_mouse_entered() -> void:
	knife_back.frame = 1


func _on_back_mouse_exited() -> void:
	knife_back.frame = 0
