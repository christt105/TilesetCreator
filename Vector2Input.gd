class_name Vector2Input

extends Control

@export var _x: LineEdit
@export var _y: LineEdit

var x: int:
	get:
		return int(_x.text)

var y: int:
	get:
		return int(_y.text)

var vector2i: Vector2i:
	get:
		return Vector2i(x, y)
