extends Node2D

@export var radius : float = 10
@export var color : Color = Color.WHITE
@onready var collision: CollisionShape2D = $collision

func _ready() -> void:
	collision.shape.set("radius",radius)

func _process(delta: float) -> void:
	pass

func _draw() -> void:
	draw_circle(Vector2.ZERO,radius,color)
