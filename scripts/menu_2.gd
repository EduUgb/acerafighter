extends Node2D





func _on_confg_pressed() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/menu.tscn")


func _on_escoger_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/selector.tscn")
