extends Node3D

var enemy_path: Path3D
var target: PathFollow3D

@export var turret_range: float = 10.0
@export var projectile: PackedScene

@onready var projectile_spawn_point: Marker3D = $TurretBase/Cannon/ProjectileSpawnPoint
@onready var turret_base: Node3D = $TurretBase
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _physics_process(delta: float) -> void:
	target = find_best_target()
	if target:
		turret_base.look_at(target.global_position, Vector3.UP, true)


func _on_timer_timeout() -> void:
	if target:
		var new_projectile = projectile.instantiate()
		new_projectile.global_position = projectile_spawn_point.global_position
		add_child(new_projectile)
		new_projectile.direction = turret_base.global_transform.basis.z
		animation_player.play("fire")


func find_best_target() -> PathFollow3D:
	var best_target = null
	var best_progress = 0
	for enemy in enemy_path.get_children():
		if enemy is PathFollow3D:
			var enemy_distance = global_position.distance_to(enemy.global_position)
			if enemy.progress > best_progress and enemy_distance <= turret_range:
				best_target = enemy
				best_progress = enemy.progress
	return best_target
