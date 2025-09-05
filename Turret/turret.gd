extends Node3D

var enemy_path: Path3D

@export var projectile: PackedScene

@onready var projectile_spawn_point: Marker3D = $TurretBase/TurretTop/BarrelBase/ProjectileSpawnPoint


func _physics_process(delta: float) -> void:
	var enemy = enemy_path.get_children().back()
	look_at(enemy.global_position, Vector3.UP, true)


func _on_timer_timeout() -> void:
	var new_projectile = projectile.instantiate()
	new_projectile.global_position = projectile_spawn_point.global_position
	add_child(new_projectile)
	new_projectile.direction = global_transform.basis.z
