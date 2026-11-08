extends Node2D

@export var speed : float = 200
@export var length : int = 50
@export var radius : float = 5
@export var anchor : Vector2 = Vector2.ZERO

@onready var bone: Line2D = $bone

var gravity : Vector2 = Vector2(0,100)

func _ready() -> void:
	for i in range(0,length):
		bone.add_point(Vector2(i*200+100,200.0))
		
func _process(delta: float) -> void:
	
	if bone.get_point_count() == 0:
		return
	#var move = Vector2(
			#Input.get_action_strength("right") - Input.get_action_strength("left"),
			#Input.get_action_strength("down") - Input.get_action_strength("up")
	#)
	var move = (get_local_mouse_position() - bone.get_point_position(0)).limit_length(speed*delta)
	
	if move.x != 0 or move.y != 0:
		bone.set_point_position(0, bone.get_point_position(0) + move) 

	for i in range(1,bone.get_point_count()):
		bone.set_point_position(i, 
			bone.get_point_position(i - 1) + (bone.get_point_position(i)-bone.get_point_position(i-1)).limit_length(radius)
		)
		
	bone.set_point_position(bone.get_point_count()-1, anchor)

	for i in range(bone.get_point_count()-2,-1,-1):
		bone.set_point_position(i, 
			bone.get_point_position(i+1) + (bone.get_point_position(i)-bone.get_point_position(i+1)).limit_length(radius)
			+ gravity*delta
		)
		
	
	
	queue_redraw()

func _draw() -> void:
	pass
	#for i in range(0,bone.get_point_count()):
		#draw_circle(bone.points[i],10,"red")
