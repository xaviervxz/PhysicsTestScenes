class_name SpinningForce2D extends ScalingForce2D

@export var clockwise:bool = true

func get_orientation_of_force_at_point(point) -> Vector2:
	var orientation = super.get_orientation_of_force_at_point(point)
	return Vector2(orientation.y, -orientation.x)
