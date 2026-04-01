extends Area

onready var game_manager = get_tree().get_root().get_node("Spatial/game_manager")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func player_entered(body):
  if (body.name == "Player"): 
	  game_manager.notify(game_manager.possible_actions.enter_place_called, name);
