class_name RopeSegment extends RigidBody3D


@export var anchor : CollisionObject3D

func _ready():
	if anchor:
		attach_to(anchor)

func attach_to(node : CollisionObject3D):
	if node:
		$AnchorPin.node_b = node.get_path()
	
