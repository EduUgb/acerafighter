class_name hud

extends CanvasLayer

@onready var infolbl = get_node("/root/Node2D/CanvasLayer/infolbl")


func actualizar(texto: String) -> void:
	infolbl.text = texto
	
