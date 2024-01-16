extends RigidBody2D

@export var has_root_bone : bool = false
var online = false
func _ready():
	online = true

func _physics_process(delta):
	if online:
		for i in $Skeleton2D.get_bone_count():
			var bone = $Skeleton2D.get_bone(i)
			if i == 0 and has_root_bone:
				bone.position = bone.position
			else:
				bone.position = get_node(str(i)).position 
