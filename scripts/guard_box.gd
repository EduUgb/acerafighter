# BloqueoEstado.gd
class_name BloqueoEstado
extends PlayerState

@export var duracion_bloqueo := 3.0
var tiempo_actual := 0.0

func enter() -> void:
	player.nodo_bloqueo.activar()
	player.animacion.play("")
	tiempo_actual = 0.0
	player.hurtbox.monitorable = false  # Desactiva daño normal

func exit() -> void:
	player.nodo_bloqueo.desactivar()
	player.hurtbox.monitorable = true
	player.animacion.play("bloqueo_fin")

func process_physics(delta: float) -> estados:
	tiempo_actual += delta
	
	# Transición si pasa el tiempo o suelta el botón
	if tiempo_actual >= duracion_bloqueo or not Input.is_action_pressed("bloquear"):
		return idleEstado if player.is_on_floor() else fallEstado
	
	# Detección de bloqueo exitoso
	if player.nodo_bloqueo.bloqueo_exitoso:
		return bloqueoExitoEstado
	
	return null
