extends CanvasLayer


@onready var retry_button: Button = $CenterContainer/PanelContainer/VBoxContainer/HBoxContainer/RetryButton
@onready var quit_button: Button = $CenterContainer/PanelContainer/VBoxContainer/HBoxContainer/QuitButton


func _ready() -> void:
	retry_button.pressed.connect(func(): 
		get_tree().reload_current_scene()
		)
	quit_button.pressed.connect(func():
		get_tree().quit()
		)
