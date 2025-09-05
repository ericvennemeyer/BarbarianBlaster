extends PathFollow3D

var current_health: int:
	set(health_in):
		current_health = health_in
		print(current_health)
		if current_health < 1:
			queue_free()

@export var max_health: int = 50
@export var speed: float = 5.0

@onready var base: Base = get_tree().get_first_node_in_group("Base")


func _ready() -> void:
	current_health = max_health


func _process(delta: float) -> void:
	progress += speed * delta
	if progress_ratio == 1.0:
		base.take_damage()
		set_process(false)
