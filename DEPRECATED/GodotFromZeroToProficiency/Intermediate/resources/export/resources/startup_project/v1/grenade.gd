extends RigidBody

# Grenade variables
var timer : Timer;

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 2
	timer.start()
	timer.connect("timeout", self, "destroy")

func destroy():
	var targets = get_tree().get_nodes_in_group("target")
	var size = targets.size()
	if (targets != null):
		for index in targets:
			var other_node = index;
			var distance_to_target = global_transform.origin.distance_to(other_node.global_transform.origin)
			if (distance_to_target < 5):
				other_node.queue_free()
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
