extends Node2D









func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/menu.tscn")


func _on_escoger_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/selector.tscn")


func _on_guia_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/guia.tscn")
