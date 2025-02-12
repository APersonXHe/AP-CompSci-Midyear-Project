extends Node

var player_dead = false
var player_paused = false
var current_level = ""

var player_won = false

signal player_death  # signal that will be emitted when the player dies
signal player_pause # signal that will be emitted when the game is paused
signal player_victory # signal that will be emitted when a level is complete
