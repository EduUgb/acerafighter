class_name PlayerBlockState
extends PlayerState

# Asegúrate que esta ruta es correcta
@onready var hurt_box: Area2D = $"../dolor/HurtBox"


func enter() -> void:
	super()
	
	# Debug: Verifica que la referencia existe
	if hurt_box:
		hurt_box.set_deferred("monitoring", false)
		hurt_box.set_deferred("monitorable", false)
		print("HurtBox desactivada")  # Confirmación en consola
	else:
		printerr("Error: No se encontró HurtBox")
	
	player.animacion.play(blockAnima)

func exit() -> void:
	if hurt_box:
		hurt_box.set_deferred("monitoring", true)
		hurt_box.set_deferred("monitorable", true)
		print("HurtBox reactivada")  # Confirmación en consola

func process_physics(delta: float) -> estados:
	# Si el botón de bloqueo ya no está presionado
	if not Input.is_action_pressed(block):
		return idleEstado if player.is_on_floor() else fallEstado
	
	# Mantener la animación bloqueada si se detiene
	if not player.animacion.is_playing():
		player.animacion.play(blockAnima)
	
	return null
