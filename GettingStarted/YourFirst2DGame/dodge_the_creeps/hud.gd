extends CanvasLayer

# Notifies "Main" node that the button has been pressed
signal start_game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Display temporary message
func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
# Show Game Over message
func show_game_over():
	show_message("Game Over")
	# Wait until MessageTimer counts down
	await $MessageTimer.timeout
	
	# Show new message
	$Message.text = "Dodge the Creeps!"
	$Message.show()
	
	# Make a one-shot timer and wait for it to finish
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
	
# Update the score
func update_score(score):
	$ScoreLabel.text = str(score)

# When the start button is pressed
func _on_start_button_pressed() -> void:
	$StartButton.hide()
	start_game.emit()

# Hide messages when timer times out
func _on_message_timer_timeout() -> void:
	$Message.hide()
