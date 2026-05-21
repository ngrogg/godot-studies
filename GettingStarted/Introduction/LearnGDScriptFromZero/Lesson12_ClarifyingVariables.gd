var angular_speed = 4

func _process(delta):
	rotate(angular_speed * delta)

## Bad code
#func _process(delta):
#	var angular_speed = 4
#	rotate(angular_speed * delta)
#
#func set_angular_speed(new_angular_speed):
#	angular_speed = new_angular_speed

## Corrected code - note the adjusted scope
#var angular_speed = 4
#
#func _process(delta):
#	rotate(angular_speed * delta)
#
#func set_angular_speed(new_angular_speed):
#	angular_speed = new_angular_speed
