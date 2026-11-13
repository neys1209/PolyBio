class_name Creature
extends Node2D

var body_size : float = 10
var leg_length : float = 10
var leg_times : int = 2

var legs : Array[Leg]

func _ready() -> void:
	legs.append(Leg.new(Vector2(body_size,0),leg_length))
	legs[-1].points[-1] += (Vector2.LEFT + Vector2.DOWN) * 100
	legs.append(Leg.new(Vector2(-body_size,0),leg_length))
	legs[-1].points[-1] += (Vector2.RIGHT + Vector2.DOWN) * 100
	
func _draw() -> void:
	draw_circle(Vector2.ZERO,body_size,Color.WHEAT)
	for l in legs:
		print(l.points)
		for i in range(l.points.size()-1):
			draw_line(l.points[i],l.points[i+1],Color.MEDIUM_VIOLET_RED,3)

func _process(delta: float) -> void:
	pass
	
class Leg:
	var length : float
	var times : int 
	var points : PackedVector2Array
	
	func _init(anchor_point : Vector2, length : float,times : int = 2) -> void:
		self.length = length
		self.times = times
		points.append(anchor_point)
		for i in range(times):
			points.append(Vector2.LEFT)
		self.update()
			
	func update() -> void:
		for j in range(3):
			for i in range(points.size()-1,-1,-1):
				if i == points.size()-1:
					continue
				points[i] = (points[i] - points[i+1]).normalized() * self.length
			
			for i in range(points.size()):
				if i == 0:
					continue
				points[i] = (points[i] - points[i-1]).normalized() * self.length
					
			
	





#
	
