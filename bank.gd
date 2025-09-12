extends MarginContainer


@export var starting_gold: int = 150

var gold: int:
	set(gold_in):
		gold = max(gold_in, 0)
		label.text = "Gold: " + str(gold)

@onready var label: Label = $Label


func _ready() -> void:
	gold = starting_gold
