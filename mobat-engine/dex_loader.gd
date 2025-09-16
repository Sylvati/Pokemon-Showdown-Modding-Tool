extends Node

@export var mods_path: String = "res://Mods"
@export var global_seperator: String = "#"
@export var amount_of_seperators: int = 50

# Called when the node enters the scene tree for the first time.
# Loads mods
func _ready() -> void:
	# Load built-in (res://) mods
	print("Loading built-in mods...")
	load_built_in_mods()
	# Load user:// mods
	print("Loading user mods...")
	load_user_mods()

func load_user_mods() -> void:
	# Print sep
	print_seperator()
	pass # Implement

# Finds the mods to load
func load_built_in_mods() -> void:
	# Print sep
	print_seperator()
	# Open directory
	var dir := DirAccess.open(mods_path)
	# If we find the mods directory
	if dir:
		# Set to the beginning 
		dir.list_dir_begin()
		# Get the next folder
		var mod_name = dir.get_next()
		# While folder still exists
		while mod_name != "":
			# Print that we found a mod
			print("Found mod: ", mod_name)
			# Load the individual mod
			load_mod(mod_name)
			# Iterate to the next
			mod_name = dir.get_next()
	
# Loads an individual mod		
func load_mod(mod_name: String):
	# Print diagnostic info
	print_seperator()
	print("Now loading: ", mod_name)
	# Print the path
	var mod_path = mods_path + "/" + mod_name
	print("Mod path: ", mod_path)
	# Open dex
	var dex_dir := DirAccess.open(mod_path + "/dex")
	# Check if the dex exists
	if dex_dir:
		print("Found dex folder!")
		print("Loading dex...")
		load_dex(mod_name, dex_dir)
	else:
		print("Dex not present.")

func load_dex(mod_name: String, dex_dir: DirAccess):
	# Try to load dex.json
	var files = dex_dir.get_files()
	if(files.has("dex.json")):
		print("Found dex.json!")
		print("Loading dex.json...")
		
		# Open dex.json
		var dex_json_path := dex_dir.get_current_dir().path_join("dex.json")
		
		# Read contents
		var json_text := FileAccess.get_file_as_string(dex_json_path)
		
		# Parse JSON
		var parsed: Dictionary = JSON.parse_string(json_text)
		if typeof(parsed) == TYPE_DICTIONARY:
			# Create a variable to hold all entries
			var entries: Dictionary = {}
			# Loop through parsed dictionary entries
			# Adds all dex entries from the json
			for key in parsed:
				var value = parsed[key]
				# Create the dex entry
				var dex_entry: DexEntry = ModManager.create_dex_entry_from_json(value, mod_name, key)
				# Add it to the entries
				entries[key] = dex_entry
			
			# Store into ModManager under mod_name
			ModManager.add_mod(mod_name + ":dex", entries)
			print("Successfully loaded dex.json for ", mod_name)
		else:
			push_error("dex.json in %s is not a valid JSON dictionary!" % mod_name)
	else:
		print("No dex.json found in", mod_name)

# Prints the seperator between mods
func print_seperator(seperator: String = global_seperator, amount: int = amount_of_seperators):
	# Holder string
	var thing_to_print = ""
	# Fill it up
	for i in range(amount):
		thing_to_print += seperator
	# Print it out
	print(thing_to_print)
