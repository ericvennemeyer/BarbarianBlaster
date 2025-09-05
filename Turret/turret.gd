extends Node3D


@export var projectile: PackedScene

@onready var projectile_spawn_point: Marker3D = $TurretBase/TurretTop/BarrelBase/ProjectileSpawnPoint


func _on_timer_timeout() -> void:
	var new_projectile = projectile.instantiate()
	new_projectile.global_position = projectile_spawn_point.global_position
	add_child(new_projectile)
