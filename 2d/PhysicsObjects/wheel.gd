class_name DemoShape2D extends CollisionObject2D

func _ready():
	$CollisionShape2D.scale = scale
	$Sprite.scale = scale
