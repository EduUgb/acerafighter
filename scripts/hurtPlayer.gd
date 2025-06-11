class_name HurtBoxPersonal

extends HurtBox
#@onready var PainEstado: PlayerPainState
var areaGolpeada: Node2D = null

func _on_area_entered(area: Area2D):
	if area == null: return
	areaGolpeada = area.owner
	danio()
func enter() -> void:
	$HurtBox.monitoring = false  # Desactiva detección de golpes
	$HurtBox.monitorable = false  # Evita que otros lo detecten

func exit() -> void:
	$HurtBox.monitoring = true   # Reactiva al salir
	$HurtBox.monitorable = true
