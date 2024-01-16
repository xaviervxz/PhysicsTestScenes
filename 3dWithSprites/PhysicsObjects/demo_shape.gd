class_name DemoShape3D extends CollisionObject3D

func _ready():
	$CollisionShape.scale = scale
	$Sprite.scale = scale
