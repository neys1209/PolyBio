extends Camera2D

@export var move_speed := 500.0
@export var zoom_speed := 0.3
@export var min_zoom := 0.5
@export var max_zoom := 8.0

func _ready() -> void:
	zoom.x = (max_zoom + min_zoom) / 2
	zoom.y = (max_zoom + min_zoom) / 2
	
func _process(delta : float) -> void:
	var direction := Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	)
	position += direction.normalized() * move_speed * delta
	

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("zoom_in"):
		zoom += Vector2.ONE * zoom_speed

	elif event.is_action_pressed("zoom_out"):
		zoom -= Vector2.ONE * zoom_speed
	
	zoom.x = clamp(zoom.x, min_zoom, max_zoom)
	zoom.y = clamp(zoom.y, min_zoom, max_zoom)


#end
