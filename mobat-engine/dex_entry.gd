extends Resource
class_name DexEntry

# Dex Numbers
# I am making this choice because I want modders to be able to choose
# whichever number they please, but for code's sake we'll have to give
# a different internal number.
@export var visual_dex_number: int 
@export var internal_id_number: int
# Name
@export var display_name: String
# Types
# This needs to be an array, as it will be infinitely large. 
# Why-not support multi-types?
# Maybe make a type class?
@export var types: Array
# Gender Ratio
# This is going to also be moddable, because why not? I suppose.
@export var gender_ratio: Dictionary
# Base Stats
# Dictionary. Technically new stats could be added, if you please.
# Standard is going to be HP, ATK, DEF, SPA, SPD, SPE
@export var base_stats: Dictionary
# Abilities
# Dictionary. I don't really care how many abilities are given. 
# Maybe make an ability type?
@export var abilities: Dictionary
# Height in Meters
# I actually don't know why this is a thing other than just, fun dex stuff
@export var height_meters: float
# Weight in Kilograms
# Same here
@export var weight_kilograms: float
# Color
# Don't ask why this exists. I don't know.
@export var color: String
# Pre evolution
# This is where I don't quite agree with Showdown's data structure design.
# This implies only a single possible pre-evolution, which could technically
# not be true. However, I don't care to fix this right now, so hopefully
# I don't forget about this.
@export var pre_evolution: String
# Evo Level
@export var evolution_level: int
# Egg Groups
# Maybe implement an Egg Group type?
@export var egg_groups: Array
# Other Formes (I think this is for megas.)
@export var other_formes: Array
# Forme Order (I don't know the point of this.
@export var forme_order: Array
# Can Gigantamax (Stores the G-Max move? Dunno)
@export var can_gigantamax: String
# Sprite location (May change later, not sure
@export var sprite_location: String
