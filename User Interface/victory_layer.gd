extends CanvasLayer


@onready var retry_button: Button = $CenterContainer/PanelContainer/VBoxContainer/HBoxContainer/RetryButton
@onready var quit_button: Button = $CenterContainer/PanelContainer/VBoxContainer/HBoxContainer/QuitButton

@onready var star_1: TextureRect = %Star1
@onready var star_2: TextureRect = %Star2
@onready var star_3: TextureRect = %Star3
@onready var health_label: Label = $CenterContainer/PanelContainer/VBoxContainer/HealthLabel
@onready var money_label: Label = $CenterContainer/PanelContainer/VBoxContainer/MoneyLabel

@onready var base = get_tree().get_first_node_in_group("Base")
@onready var bank = get_tree().get_first_node_in_group("Bank")

func _ready() -> void:
	visible = false
	retry_button.pressed.connect(func(): 
		get_tree().reload_current_scene()
		)
	quit_button.pressed.connect(func():
		get_tree().quit()
		)


func victory() -> void:
	visible = true
	if base.max_health == base.current_health:
		star_2.modulate = Color.WHITE
		health_label.visible = true
	if bank.gold >= 500:
		star_3.modulate = Color.WHITE
		money_label.visible = true
