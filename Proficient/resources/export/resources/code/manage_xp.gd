extends Node2D

var initial_power = 0
var initial_accuracy = 0
var initial_communication = 0
var initial_xp = 0;
var delta_power
var delta_accuracy
var delta_communication
var delta_xp;

var current_power
var current_accuracy
var current_communication
var current_xp;
var previous_power
var previous_accuracy
var previous_communication
var previous_xp


onready  var power_slider = get_node("power_slider")
onready  var accuracy_slider = get_node("accuracy_slider")
onready  var communication_slider = get_node("communication_slider")
onready  var power_label = get_node("power_label")
onready  var accuracy_label = get_node("accuracy_label")
onready  var communication_label = get_node("communication_label")
onready var game_manager = get_node("../game_manager")
onready var initial_xp_text_ui = get_node("text_xp")

func init():
#	initial_power = 40
#	initial_accuracy = 40
#	initial_communication = 40
#	initial_xp = 50

	initial_power = game_manager.player_info.power
	initial_accuracy = game_manager.player_info.accuracy
	initial_communication = game_manager.player_info.communication
	initial_xp = game_manager.player_info.xp

	current_xp = initial_xp
	current_power = initial_power
	current_communication = initial_communication
	current_accuracy = initial_accuracy
	initial_xp_text_ui.text = "" + str(initial_xp)

	power_slider.set_min(initial_power);
	power_slider.set_max(initial_power + initial_xp);
	accuracy_slider.set_min(initial_accuracy);
	accuracy_slider.set_max(initial_accuracy + initial_xp)
	communication_slider.set_min(initial_accuracy)
	communication_slider.set_max(initial_communication + initial_xp)
	power_label.text = "Power(" + str(current_power) +")";
	accuracy_label.text = "Accuracy(" + str(current_accuracy) + ")";
	communication_label.text = "Communication(" + str(current_communication) + ")"
	

func save_current_values():
	previous_power = current_power
	previous_accuracy = current_accuracy
	previous_communication = current_communication

func get_new_values():
	current_power = power_slider.get_value()
	current_accuracy = accuracy_slider.get_value()
	current_communication = communication_slider.get_value()


func calculate_deltas():
	delta_power = current_power - initial_power;
	delta_accuracy = current_accuracy - initial_accuracy;
	delta_communication = current_communication - initial_communication;
	delta_xp = delta_accuracy + delta_power + delta_communication;
	initial_xp_text_ui.text = "" + str(initial_xp- delta_xp);

func set_xp(value):
	print("Set XP" + str(value))
	var current_xp_as_text = initial_xp_text_ui.text;
	current_xp = int(current_xp_as_text);
	save_current_values()
	get_new_values()
	if (current_xp == 0):
		if (current_power > previous_power): current_power = previous_power;
		if (current_accuracy > previous_accuracy): current_accuracy = previous_accuracy;
		if (current_communication > previous_communication): current_communication = previous_communication
		power_slider.set_value(current_power);
		accuracy_slider.set_value(current_accuracy);
		communication_slider.set_value(current_communication)	
	calculate_deltas();
	power_label.text = "Power(" + str(current_power) +")";
	accuracy_label.text = "Accuracy(" + str(current_accuracy) + ")";
	communication_label.text = "Communication(" + str(current_communication) + ")";

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	init()
	power_slider.connect("value_changed",self,"set_xp")
	accuracy_slider.connect("value_changed",self,"set_xp")
	communication_slider.connect("value_changed",self,"set_xp")

func _process(delta):
	if (Input.is_action_just_pressed("validate_space")):
		game_manager.player_info.power = current_power
		game_manager.player_info.accuracy = current_accuracy;
		game_manager.player_info.communication = current_communication
		game_manager.player_info.xp = current_xp
		hide()
#		game_manager.increase_stage(1)
#		game_manager.load_new_scene()

		if (game_manager.current_stage == game_manager.nb_quests-1):
			game_manager.load_end_screen()
		else:
			game_manager.increase_stage(1)
			game_manager.load_new_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
