class_name Base
extends Node3D


@export var max_health: int = 5
var current_health: int:
	set(health_in):
		current_health = health_in
		label_3d.text = "%s/%s" %[current_health, max_health]
		var white: Color = Color.WHITE
		var red: Color = Color.RED
		label_3d.modulate = red.lerp(white, float(current_health) / float(max_health))
		if current_health < 1:
			get_tree().reload_current_scene()

@onready var label_3d: Label3D = $Label3D


func _ready() -> void:
	current_health = max_health


func take_damage() -> void:
	current_health -= 1
