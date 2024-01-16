class_name Force extends Area2D

@export var strength : float
@export var direction : Vector2

func _ready():
	if !strength:
		strength = 1000
	if !direction:
		direction = Vector2(0,1)

func _physics_process(delta):
	for body in get_overlapping_bodies():
		if body is RigidBody2D:
			var force_val = get_strength_at_point(body.position)
			var force_orientation = get_orientation_of_force_at_point(body.position)
			body.apply_central_force(force_val * force_orientation * delta)

func get_strength_at_point(point) -> float:
	return strength


func get_orientation_of_force_at_point(point) -> Vector2:
	return direction.normalized()
	
	
func get_reciprocal_force_from_object(obj):
	return Vector2(0,0)
