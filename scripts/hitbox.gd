class_name HitBox
extends Area2D

func _ready() -> void:
	collision_layer = 2
	collision_mask = 0
	monitoring = true    # Asegúrate que está activo
