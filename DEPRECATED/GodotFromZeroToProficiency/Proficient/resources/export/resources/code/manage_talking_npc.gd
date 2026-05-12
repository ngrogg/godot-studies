extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
onready var pc_node = get_node("AnimationPlayer")
func _ready():
	pc_node.get_animation("idle").loop = true

func _process(delta):
	pc_node.play("idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
