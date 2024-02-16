extends ColorPickerButton


func _ready() -> void:
	var picker := get_picker()
	
	picker.can_add_swatches = false
	picker.sampler_visible = false
	picker.presets_visible = false

