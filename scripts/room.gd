extends Node2D

@onready var map: TileMapLayer = $map
@export var size : Vector2i = Vector2i(10,10)

func _ready() -> void:
	map.clear()
	for x in range(size.x):
		for y in range(size.y):
			if (x == 0 or y == 0 or x == size.x-1 or y == size.y-1):
				map.set_cell(Vector2i(x,y),1,Vector2i(randi_range(2,3),0))
