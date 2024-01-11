class_name Grabbable extends RigidBody2D

@export var sprite : Sprite2D
@export var collision : CollisionShape2D

func _ready():
	sprite = $Sprite
	collision = $CollisionShape2D
	
func grab():
	collision.disabled = true
	
func drop():
	collision.disabled = false
