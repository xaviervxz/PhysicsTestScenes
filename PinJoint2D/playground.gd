extends Node2D

var plank = RigidBody2D.new()
plank.position = Vector2(400, 300)
add_child(plank)

var base = RigidBody2D.new()
base.position = Vector2(400, 350)
add_child(base)

var joint = PinJoint2D.new()
joint.position = Vector2(400, 325) # Positioned exactly between the plank and base
add_child(joint)
joint.set_node_a(plank.get_path())
joint.set_node_b(base.get_path())

plank.limit_angular_velocity = true
plank.angular_velocity_limit = 1.0
