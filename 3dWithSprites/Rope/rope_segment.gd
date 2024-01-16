class_name RopeSegment extends RigidBody3D


@export var anchor : CollisionObject3D

func _ready():
	if anchor:
		$AnchorPin.node_b = anchor.get_path()
