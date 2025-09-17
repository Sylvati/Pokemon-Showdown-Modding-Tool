extends Node

@export var battle_cam_offset: Vector2 = Vector2(1920, 0)
var camera: Camera2D

func _ready():
	camera = $"../Camera2D"

func _on_start_button_pressed() -> void:
	# Output
	print("Start Battle.")
	
	# Move the camera
	camera.offset = Vector2(1920, 0)
	
	# Let's focus on 1v1s for now.
	
	# Start of the battle 
	
	# After trainers are shown and battle starts, both pokemon are sent
	# out with accompanying text
	
	# Then, entry abilities are activated based on speed order
	
	# Once all abilities are activated, both players now have to select their action
	
	# Show the player the Fight, Bag, Pokemon, and Run options.
	
