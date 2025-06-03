class_name HurtBox

extends Area2D

@onready var maquina_Estados = get_parent().get_parent()  # jugador1
@onready var player = maquina_Estados  # por claridad



func _ready():
	collision_layer = 0
	collision_mask= 2
	area_entered.connect(_on_area_entered)
	
	
func _on_area_entered(area: Area2D):
	if area is HitBox:
		maquina_Estados.cambiaEstado(maquina_Estados.dolor)
	
