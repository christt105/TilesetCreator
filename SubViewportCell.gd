@tool
class_name SubViewportCell
extends SubViewport

@onready var cell: Cell = $Cell

var cell_size: Vector2i:
	get:
		return cell.size
	set(value):
		cell.size = value
