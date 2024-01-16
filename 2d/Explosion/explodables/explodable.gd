class_name Explodable2D extends RigidBody2D

func explode(explosion : ExplosiveForce):
	get_tree().call_group("explodables", "explode", explosion)
	var force : Vector2 = explosion.get_force_at_point(position)
	
