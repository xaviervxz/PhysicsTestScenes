class_name SoftPoint extends RigidBody2D



@export var neighbors : Array[RigidBody2D] = []
@export var stiffness : float = 64


func activate():
	for node in neighbors:
		var joint = DampedSpringJoint2D.new()
		joint.node_a = self.get_path()
		joint.node_b = node.get_path()
		joint.stiffness = stiffness
		joint.length = (position-node.position).length()
		add_child(joint)
			
