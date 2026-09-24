extends HSlider

# Audio bus & ID variables.
@export var audio_bus_name: String
var audio_bus_id

func _ready():
	# Assign bus ID.
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)

# Volume slider update.
func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(audio_bus_id, value)
