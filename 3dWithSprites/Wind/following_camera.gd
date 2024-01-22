extends Camera3D

@export var target : Node3D
@export var default_camera_height : float = 3
@export var max_camera_height : float = 6

const FOLLOW_SPEED : float = .5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var source_pos = target.position
	var cam_pos = position
	var cam_on_source_plane = Vector3(cam_pos.x, source_pos.y, cam_pos.z)
	var distance = source_pos.distance_to(cam_on_source_plane)
	
	var cam_height = min(max_camera_height, default_camera_height + (max_camera_height-default_camera_height)/distance)
	var source_pos_on_cam_plane = Vector3(source_pos.x, cam_height, source_pos.z)
	
	position = position.lerp(source_pos_on_cam_plane, delta * distance * FOLLOW_SPEED)
