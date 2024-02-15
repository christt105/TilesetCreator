extends Control

@onready var grid_generator: GridGenerator = $"../.."

@onready var grid_size: Vector2Input = $MarginContainer/PanelContainer/Sizes/GridSizeVector2Input
@onready var cell_size: Vector2Input = $MarginContainer/PanelContainer/Sizes/CellSizeVector2Input

@onready var background_color: ColorPickerButton = $MarginContainer/PanelContainer/BackgroundColor/ColorPickerButton
@onready var border_color: ColorPickerButton = $MarginContainer/PanelContainer/BorderColor/ColorPickerButton
@onready var border_width: LineEdit = $MarginContainer/PanelContainer/BorderWidth/ColorPickerButton
@onready var font_color: ColorPickerButton = $MarginContainer/PanelContainer/FontColor/ColorPickerButton
@onready var font_size: LineEdit = $MarginContainer/PanelContainer/FontSize/ColorPickerButton


@onready var create_button: Button = %CreateButton
@onready var download_button: Button = %DownloadButton


func _ready() -> void:
	create_button.pressed.connect(_on_create_button_pressed)
	download_button.pressed.connect(_on_download_button_pressed)
	
	call_deferred("_on_create_button_pressed")


func _on_create_button_pressed() -> void:
	_create()
	

func _create() -> void:
	grid_generator.grid_size = grid_size.vector2i
	grid_generator.tile_size = cell_size.vector2i
	
	grid_generator.background_color = background_color.color
	grid_generator.border_color = border_color.color
	grid_generator.cell_width = int(border_width.text)
	grid_generator.font_color = font_color.color
	grid_generator.font_size = int(font_size.text)
	
	grid_generator.create_texture()
	

func _on_download_button_pressed() -> void:
	grid_generator.save_image("res://Image.png")
	
