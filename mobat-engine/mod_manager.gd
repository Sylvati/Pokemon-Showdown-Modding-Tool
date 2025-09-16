extends Node

const INT_MIN = -9223372036854775808

## Dict of loaded mod data
## Key = mod name, Value = parsed data
@export var mod_data: Dictionary = {}

@export var created_entries: Array[DexEntry] = []

## Adds a mod to the data dictionary.
func add_mod(file_name: String, data: Dictionary) -> void:
	mod_data[file_name] = data
	
## Returns a single mod based on mod name.
func get_mod(mod_name: String) -> Dictionary:
	if mod_data.has(mod_name):
		return mod_data[mod_name]
	return {} # Fallback, empty
	
## Returns all mod data.
func get_all_mods() -> Dictionary:
	return mod_data

## Factory for DexEntrys.
func create_dex_entry_from_json(data: Dictionary, mod_name: String, key: String) -> DexEntry:
	# Create the entry.
	var entry := DexEntry.new()
	# Set dex number
	entry.visual_dex_number = data.get("num")
	#@export var internal_id_number: int
	# What do we do about this? Maybe have a static variable?
	# Set name
	entry.display_name = data.get("name")
	# Set types
	entry.types = data.get("types")
	# Set gender ratio
	entry.gender_ratio = data.get("genderRatio", {})
	# Set base stats
	entry.base_stats = data.get("baseStats")
	# Set abilities
	entry.abilities = data.get("abilities")
	# Set height
	entry.height_meters = data.get("heightm")
	# Set weight
	entry.weight_kilograms = data.get("weightkg")
	# Set color
	entry.color = data.get("color")
	# Set pre evolution
	entry.pre_evolution = data.get("prevo", "")
	# Set evo level
	entry.evolution_level = data.get("evoLevel", INT_MIN)
	# Set egg groups
	entry.egg_groups = data.get("eggGroups")
	# Set other formes
	entry.other_formes = data.get("otherFormes", [])
	# Set forme order
	entry.forme_order = data.get("formeOrder", [])
	# Set can gigantamax
	entry.can_gigantamax = data.get("canGigantamax", "")
	# Set sprite location
	entry.sprite_location = "res://Mods/" + mod_name + "/sprites/" + key + ".png"
	return entry
