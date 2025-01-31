extends Node

# THIS CLASS IS MEANT TO BE INHERITED
# The intention is for all its variables to be globally
# available for all objects

class_name StateMachine

# state refers to the player state
# i.e. "dead", "alive", "sprinting" etc
# this will be useful for determining global events like
# player death
var state:
	get = get_state, set = set_state
var previous_state = null

# list of possible states
var states = {}

# parent refers to whichever script/object that inherits 
# this script
@onready var parent = get_parent()

func _physics_process(delta):
	if state != null:
		_state_logic(delta)
		var transition = _get_transition(delta)
		if transition != null:
			set_state(transition)

func _state_logic(delta):
	pass
	
func _get_transition(delta):
	return null
	
func _enter_state(new_state, old_state):
	pass

func _exit_state(old_state, new_state):
	pass
	
func get_state():
	return state
	
func set_state(new_state):
	previous_state = state
	state = new_state
	
	if previous_state != null:
		_exit_state(previous_state, new_state)
	if new_state != null:
		_enter_state(new_state, previous_state)
		
func add_state(state_name):
	states[state_name] = states.size()
