extends Node

var player_dead = false
var player_paused = false
var current_level = ""

signal player_death  # signal that will be emitted when the player dies
signal player_pause # signal that will be emitted when the game is paused
