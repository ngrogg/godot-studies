extends StaticBody

var health:int = 100 
var hit_timer:float;
var hit_flash:bool;
var alpha:float;

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	alpha = 0.0
	var material;
	var the_node = get_node("CSGMesh")
	material = the_node.material
	material.albedo_color = Color(1,0,0,alpha)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	if (hit_flash):
		alpha -= delta
		var material;
		var the_node = get_node("../CSGMesh")
		material = the_node.material #.duplicate()
		material.albedo_color = Color(1,0,0,alpha)

		if (alpha <= 0):
			hit_flash = false
			alpha = 0

func set_health(new_health:int):
		health = new_health
		if (health <=0):
				health = 0;
				destroy_target()
func get_health():
	return health;
func destroy_target():
	var name_of_parent = get_parent().name;
	get_parent().queue_free()

func decrease_health(increment:int):
	set_health(health-increment)
	hit_flash = true;
	alpha = 0.5

