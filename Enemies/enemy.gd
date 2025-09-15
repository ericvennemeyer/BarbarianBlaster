extends PathFollow3D

var current_health: int:
	set(health_in):
		if health_in < current_health:
			animation_player.play("TakeDamage")
		current_health = health_in
		if current_health < 1:
			bank.gold += gold_value
			queue_free()

@export var max_health: int = 50
@export var speed: float = 5.0
@export var gold_value: int = 15

@onready var base: Base = get_tree().get_first_node_in_group("Base")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var bank = get_tree().get_first_node_in_group("Bank")


func _ready() -> void:
	current_health = max_health


func _process(delta: float) -> void:
	progress += speed * delta
	if progress_ratio == 1.0:
		base.take_damage()
		set_process(false)
		queue_free()
