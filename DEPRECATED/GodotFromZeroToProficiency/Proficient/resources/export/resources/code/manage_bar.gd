extends Node2D
var value = 0
var label = "Health"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("left_label").text = label
	update_value()

func increase_value(amount:int):
	value += amount
	if (value >= 100): value = 100 
	update_value()
func update_value():
	get_node("value_label").text = str(value)
	var scale_factor:float = value/100.0
	get_node("green_bar").rect_scale = Vector2(scale_factor,1)
func _process(delta):
	#if (Input.is_key_pressed(KEY_B)):increase_value(10)
	pass

func set_value(amount):
	value = amount
	update_value()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
