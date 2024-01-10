class_name DemoShape extends CollisionObject2D

func _ready():
	$CollisionShape2D.scale = scale
	$Sprite.scale = scale
