extends Node2D





func _on_play_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://escenas/menu_2.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
	


func _on_confg_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/config.tscn")
