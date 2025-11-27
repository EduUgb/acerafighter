extends Node2D


func _on_volver_guia_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/menu_2.tscn")
