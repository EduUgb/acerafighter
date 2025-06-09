class_name HurtBox

extends Area2D

@onready var maquina_Estados =  $"../.." # jugador1
@onready var player = $"../../.."  # por claridad
@onready var shape = $CollisionShape2D
@onready var timer = $Timer
#var invencible = false  # ← NUEVO



	
func _ready():
	shape.disabled = false  # Aseguramos que esté activa al inicio
	collision_layer = 0
	collision_mask= 2
	area_entered.connect(_on_area_entered)

	#timer.timeout.connect(_timeout)
	
func _on_area_entered(area: Area2D):
	if area == null: return

#func activarInvencibilidad():
	#invencible = true
	#call_deferred("_desactivar_shape_temporalmente")
	#timer.start(1.0)
	
func danio():
		maquina_Estados.cambiaEstado(maquina_Estados.dolor)
		#activarInvencibilidad()
		
		
		#
#func _timeout():
	#desactivarInvencibilidad()
	#
#func desactivarInvencibilidad():
	#shape.disabled = false
	#invencible = false
#
#func _desactivar_shape_temporalmente():
	#shape.disabled = true
