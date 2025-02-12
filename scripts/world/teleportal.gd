extends Area2D

@export var linked_portal: NodePath  # Assign the linked portal in the editor
var destination_portal = null
var player_can_teleport = true  # Prevent instant re-teleportation

func _ready():
	# Ensure the linked portal exists
	if linked_portal:
		destination_portal = get_node(linked_portal)

func _on_body_entered(body):
	if body is CharacterBody2D and player_can_teleport:
		if destination_portal:
			destination_portal.player_can_teleport = false  # Prevent looping
			body.position = destination_portal.global_position
			await get_tree().create_timer(0.2).timeout  # Small delay
			player_can_teleport = true  # Allow teleporting again
