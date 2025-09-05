extends Node3D


@export var projectile: PackedScene


func _ready() -> void:
	var new_projectile = projectile.instantiate()
	add_child(new_projectile)
