class_name SoftBody extends SoftPoint

var online = false
var err = 0
@export var neighbor_density = 7

func _ready():
	online = true
	var num_points =  $Edges.get_child_count()
	for i in num_points:
		var index = i+1
		var body = get_soft_point(index)
		if body is SoftPoint: 
			body.neighbors.append(self)
			neighbors.append(body)
			
			for dist in range(1,neighbor_density):
				var a = (index-dist-1) + num_points
				var b = a % num_points
				var c = b+1
				var left = (index-dist-1 + num_points) % num_points + 1
				var right = (index+dist-1+ num_points) % num_points + 1
				body.neighbors.append(get_soft_point(left))
				body.neighbors.append(get_soft_point(right))
					
			body.activate()
		else:
			var error = 1/(err)
	activate()

func _physics_process(delta):
	if online:
		for i in $Skeleton2D.get_bone_count():
			var bone = $Skeleton2D.get_bone(i)
			if i == 0:
				bone.position = position
			else:
				bone.position = get_soft_point(i).position 
			bone.look_at(self.position)

func get_soft_point(index : int) -> SoftPoint:
	var node = get_node("Edges/"+str(index))
	if node is SoftPoint:
		return node
	else:
		return null
	
