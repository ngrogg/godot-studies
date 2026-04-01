extends Node

var current_stage:int;
var timer_started:bool;
var timer;
var actions;
var targets;
var xps;
var objective_achieved
var xp_achieved

var stage_title
var stage_description
var stage_objectives
var starting_point_for_player
var panel_displayed = true
var display_timer
var start_display_timer

var nb_objectives_achieved = 0;
var nb_objectives_to_achieve = 0
var xb_achieved

enum possible_actions { do_nothing=0, talk_to= 1, acquire_a = 2, destroy_one= 3, enter_place_called = 4};
var actions_for_quest;
onready var stage_panel = get_node("../stage_panel")
onready var stage_title_text = get_node("../stage_panel/stage_title")
onready var stage_description_text = get_node("../stage_panel/stage_description")
onready var stage_objectives_text = get_node("../stage_panel/stage_objectives")
var quests:Dictionary

var player_info = PlayerInfo.new(PlayerInfo.player_type.Akai)

var nb_quests = 1

func load_quest():
#	actions = Array()
#	targets = Array()
#	xps = Array()
#	objective_achieved = Array()
#	xp_achieved = 0
	var file = File.new()
	file.open("res://quests/quests.json", file.READ)
	var json_data = parse_json(file.get_as_text())
	var json = to_json(json_data)
	quests = JSON.parse(json).result
	stage_objectives = "For this stage, you need to:\n";
	for quest in quests:
		stage_title = quests[quest].stages[current_stage].name
		stage_description = quests[quest].stages[current_stage].description
		print ("Stage: "+stage_title)
		print ("Description: "+stage_description)
		var counter = 0;
		for result in quests[quest].stages[current_stage].results:
			var action = quests[quest].stages[current_stage].results[counter].action
			var target = quests[quest].stages[current_stage].results[counter].target
			var xp = quests[quest].stages[current_stage].results[counter].xp
			actions.push_back(action)
			targets.push_back(target)
			xps.push_back(xp)
			objective_achieved.push_back(false)
			stage_objectives += "\n -> "+str(action) + " " + str(target) + " [ " + str(xp) + " XP]"
			nb_objectives_to_achieve += 1			
			counter += 1;
		print(stage_objectives)

func load_quest2():
#	actions = Array()
#	targets = Array()
#	xps = Array()
#	objective_achieved = Array()
#	actions_for_quest = Array()
	var file = File.new()
	file.open("res://quests/quests.json", file.READ)
	var json_data = parse_json(file.get_as_text())
	var json = to_json(json_data)
	quests = JSON.parse(json).result
	stage_objectives = "For this stage, you need to:\n";
	for quest in quests:
		stage_title = quests[quest].stages[current_stage].name
		stage_description = quests[quest].stages[current_stage].description
		print ("Stage: "+stage_title)
		print ("Description: "+stage_description)
		var counter = 0;
		for result in quests[quest].stages[current_stage].results:
			var action = quests[quest].stages[current_stage].results[counter].action
			var target = quests[quest].stages[current_stage].results[counter].target
			var xp = quests[quest].stages[current_stage].results[counter].xp
			var action_for_quest
			if (action.find("Acquire",0) >=0):action_for_quest=possible_actions.acquire_a
			if (action.find("Talk",0) >=0):action_for_quest=possible_actions.talk_to
			if (action.find("Destroy",0) >=0) && action.find("one",0) >=0:
				action_for_quest=possible_actions.destroy_one
			if (action.find("Enter",0 && action.find("place",0) >=0) >=0):
				action_for_quest=possible_actions.enter_place_called
			actions_for_quest.push_back(action_for_quest)
			targets.push_back(target)
			xps.push_back(xp)
			objective_achieved.push_back(false)
			print(str(action) + " " + str(target) + "[" + str(xp) + " XP]");
			stage_objectives += "\n -> " + str(action) + " " + str(target) + " [ " + str(xp) + " XP]";
			nb_objectives_to_achieve +=1
			counter+=1


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	nb_objectives_achieved = 0;
	actions = []
	targets = []
	xps = []
	objective_achieved = []
	actions_for_quest = []
	actions = []
	xp_achieved = 0

	load_quest2()
	init()
	get_node("../manage_xp").hide()
	
	count_nb_quests()

func init():
	display_quest_info()
func display_quest_info():
	stage_title_text.text = stage_title
	stage_description_text.text = stage_description;
	stage_objectives_text.text = stage_objectives + "\n Press H to Hide/Display this information";


func _process(delta):
	if (Input.is_action_just_pressed("hide_objectives")):
		panel_displayed = ! panel_displayed
		if (panel_displayed): stage_panel.show()
		else:  stage_panel.hide()

func notify(var action, var target:String):
	print("Notified: Action=" + str(action) + " Target:" + str(target));
	for i in range (0, actions_for_quest.size()):
		if (action == actions_for_quest[i] && target == targets[i] && !objective_achieved[i]):
			display_message("+" + str(xps[i]) + " XP");
			nb_objectives_achieved += 1
			xp_achieved += int(xps[i])
			objective_achieved[i] = true;
			break
	if (nb_objectives_achieved == nb_objectives_to_achieve):
		display_message("Stage Complete");		
		player_info.xp = calculate_total_xp_for_level();
		stage_complete()
		print("XPS for this level"+str(player_info.xp))
func calculate_total_xp_for_level():
	var total_xp = 0
	for i in range (0,actions_for_quest.size()):
		total_xp += int(xps[i])
	return total_xp
		
		
func display_message(var the_message):
	get_node("../user_message").show()
	get_node("../user_message").text = the_message
	var display_timer = Timer.new()
	add_child(display_timer)
	display_timer.set_wait_time(4)
	display_timer.start()
	display_timer.connect("timeout",self,"clear_message")
	
func clear_message():
	get_node("../user_message").text = ""

func increase_stage(var increment):
	current_stage += 1

func load_new_scene():
	var all_current_level_nodes = get_tree().get_nodes_in_group("level0")
	for  item in all_current_level_nodes:
		item.free()
	load_quest2()
	display_quest_info()
	panel_displayed = true
	stage_panel.show()
	
	var all_nodes_to_display = get_tree().get_nodes_in_group("level" + str(current_stage))
	for  item in all_nodes_to_display:
		item.show()
		


func stage_complete():
	get_node("../manage_xp").init()
	get_node("../manage_xp").show()
	print("Stage Complete")
	print("XPs for Player="+ str(player_info.xp))
	print("Loading stage complete scene")

func count_nb_quests():
	var file = File.new()
	file.open("res://quests/quests.json", file.READ)
	var json_data = parse_json(file.get_as_text())
	var json = to_json(json_data)
	quests = JSON.parse(json).result
	for quest in quests:
		nb_quests += 1

func load_end_screen():
	get_tree().change_scene("res://end_of_game.tscn")
