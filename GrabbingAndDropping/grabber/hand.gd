extends RigidBody2D

func _physics_process(delta):
	var range : Area2D = $GrabbingRange
	var bodies = range.get_overlapping_bodies()
	if bodies.size() > 0:
		for body in bodies:
			try_grab(body)
			
	var areas = range.get_overlapping_areas()
	if areas.size() > 0:
		for area in areas:
			if area is Trigger:
				if area.trigger_type == "drop_trigger":
					drop()
					

func try_grab(body):
	if body is Grabbable:
		var pin : Joint2D = $Palm
		body.grab()
		add_child(body)
		pin.node_b = body.get_path()

func drop():
	var pin : Joint2D = $Palm
	var held_item = get_node(pin.node_b)
	held_item.drop()
	pin.node_b = "null"
	$GrabbingRange/CollisionShape2D.disabled = true
	$OpenHandTimer.start()
	


func _on_open_hand_timer_timeout():
	$GrabbingRange/CollisionShape2D.disabled = false
