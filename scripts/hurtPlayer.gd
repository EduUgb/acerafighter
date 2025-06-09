class_name HurtBoxPersonal

extends HurtBox
#@onready var PainEstado: PlayerPainState
var areaGolpeada: Node2D = null

func _on_area_entered(area: Area2D):
	if area == null: return
	areaGolpeada = area.owner
	danio()
