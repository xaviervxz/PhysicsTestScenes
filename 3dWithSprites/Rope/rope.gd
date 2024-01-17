extends RigidBody3D

@export var start_anchor : CollisionObject3D

@export var end_anchor : CollisionObject3D

func _ready():
	var root_segment = get_node("0")
	if root_segment:
		root_segment.attach_to(start_anchor)
	var prev = start_anchor
	for body in get_children():
		if body is RopeSegment:
			body.attach_to(prev)
			prev = body
			
	if end_anchor:
		$EndAnchor.node_b = end_anchor.get_path()
