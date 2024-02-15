@tool
class_name Cell
extends Node2D

@export var size: Vector2i = Vector2i(64, 64)
@export var color: Color = Color.BLACK
@export var width: int = 4

@export var update: bool = false:
	set(value):
		update = false;
		queue_redraw()

func _draw():
	draw_rect(Rect2(0, 0, size.x, size.y), color, false, float(width))
