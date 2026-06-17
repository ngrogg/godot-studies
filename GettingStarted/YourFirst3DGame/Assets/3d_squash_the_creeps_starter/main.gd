extends Node

# Export variable to scene can be assigned to it
@export var mob_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	## Hide the Retry interface when starting the game
	$UserInterface/Retry.hide()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _on_mob_timer_timeout() -> void:
	## Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()

	## Choose a random location on the SpawnPath.
	## We store the reference to the SpawnLocation node.
	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	
	## And give it a random offset.
	mob_spawn_location.progress_ratio = randf()

	var player_position = $Player.position
	mob.initialize(mob_spawn_location.position, player_position)

	## Spawn the mob by adding it to the Main scene.
	add_child(mob)
	
	## Connect the mob to the score label to update the score upon squshing one
	mob.squashed.connect($UserInterface/ScoreLabel._on_mob_squashed.bind())

# Function to stop timer when mob hits player and show the retry interface
func _on_player_hit() -> void:
	## Stop the mob timer
	$MobTimer.stop()
	
	## Show the Retry interface
	$UserInterface/Retry.show()

# Reload the game
func _unhandled_input(event: InputEvent) -> void:
	## If action is pressed while the Retry interface is visible
	if event.is_action_pressed("ui_accept") and $UserInterface/Retry.visible:
		### Restart the scene
		get_tree().reload_current_scene()
