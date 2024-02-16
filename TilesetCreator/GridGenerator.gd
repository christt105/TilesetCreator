# Script to generate a grid to test
@tool
class_name GridGenerator
extends Node

@export var grid_size: Vector2i = Vector2i(8, 10)
@export var tile_size: Vector2i = Vector2i(64, 64)
@export var font_size: float = 35
@export var font_color: Color = Color.BLACK
@export var background_color: Color = Color.WHITE
@export var border_color: Color = Color.BLACK
@export var cell_width: int = 4

@export var _create_texture_toggle: bool = false:
	set(value):
		_create_texture_toggle = false
		create_texture()

@onready var subviewport: SubViewport = $SubViewport
@onready var grid_container: GridContainer = $SubViewport/ColorRect/GridContainer
@onready var subviewport_cell: SubViewportCell = $SubViewportCell
@onready var background_color_rect: ColorRect = $SubViewport/ColorRect

func create_texture():
	subviewport.size = tile_size * grid_size
	
	grid_container.columns = grid_size.x
	
	background_color_rect.color = background_color
	
	for child in grid_container.get_children():
		child.queue_free()
	
	subviewport_cell.cell_size = tile_size
	subviewport_cell.cell.color = border_color
	subviewport_cell.cell.width = cell_width
	
	subviewport_cell.cell.queue_redraw()
	
	var i: int = 0
	for x in range(grid_size.x):
		for y in range(grid_size.y):
			var texture_rect: TextureRect = TextureRect.new()
			texture_rect.texture = subviewport_cell.get_texture()
			var label: Label = Label.new()
			label.set_anchors_preset(Control.PRESET_FULL_RECT)
			label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			label.add_theme_color_override("font_color", font_color)
			label.add_theme_font_size_override("font_size", font_size)
			texture_rect.add_child(label)
	
			label.text = var_to_str(i)
			grid_container.add_child(texture_rect)
			i = i + 1


func save_image(path: String):
	if OS.get_name() == "Web":
		save_web(path)
	else:
		save_local(path)
	

func save_web(path:  String) -> void:
	var buffer := subviewport.get_texture().get_image().save_png_to_buffer()
	JavaScriptBridge.download_buffer(buffer, "Tileset.png")

func save_local(path: String) -> void:
	var err = subviewport.get_texture().get_image().save_png(path)
	if err != OK:
		push_error(error_string(err))
	else:
		print("Image saved")

