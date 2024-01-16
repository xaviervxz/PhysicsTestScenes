class_name SpinningForce extends ScalingForce

@export var clockwise:bool = true

func get_orientation_of_force_at_point(point) -> Vector2:
	var orientation = super.get_orientation_of_force_at_point(point)
	return Vector2(orientation.y, -orientation.x)
