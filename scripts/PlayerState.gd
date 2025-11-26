class_name PlayerState
extends estados
# Referencia al jugador (más robusta)
@onready var player: Player = owner 




var gravity: float = 2500


#nombre de las animaciones
var idleAnima: String = "idle"
var caminarAnima: String = "caminar"
var saltoAnima: String = "salto"
var caidaAnima: String = "caida"
var agacharseAnima: String = "agacharse"
var golpeAnima: String = "golpes"
var walkagaAnima: String = "walkaga"
var hitAnima: String = "danio"
var golpeAbajoAnima: String = "golpeAbajo"
var golpeArribaAnima: String = "golpeArriba"
var goldo: String = "yoSaco"
var blockAnima: String = "bloqueo22"
var especialAnima: String = "especialA"
var especialAnima2: String = "especial2"
var especialAnima3: String = "especial3"

#establece estados
@export_group("States")
@export var idleEstado: PlayerState
@export var caminarEstado: PlayerState
@export var saltoEstado: PlayerState
@export var fallEstado: PlayerState
@export var agacharseEstado: PlayerState
@export var golpeEstado: PlayerState
@export var dolorEstado: PlayerState
@export var golpeAbajoEstado: PlayerState
@export var golpeArribaEstado: PlayerState
@export var caminarAbajoEstado: PlayerState
@export var golpeAireEstado: PlayerState
@export var bloqueoEstado: PlayerState
@export var muerteEstado: PlayerState
#input keys


var izquierda: String="izquierda"
var derecha: String="derecha"
var arriba: String="arriba"
var abajo: String= "abajo"



var bloqueo2: String="bloqueo2"
var izquierda2: String="izquierda2"
var derecha2: String="derecha2"
var arriba2: String="arriba2"
var abajo2: String= "abajo2"

var golpe: String = "golpe"
var golpeArriba: String = "golpeArriba"
var golpeespecial: String = "especial"

var block: String = "bloqueo"
#base

func _ready() -> void:


	for key in Global.player_data.keys():
		if key in self:
			set(key, Global.player_data[key])

	print("Valores cargados:", idleAnima)	
	
func process_physics(delta: float) -> estados: # Retorna PlayerState, no "estados"
	# Solo aplica la gravedad si no está en el suelo.
	# El movimiento horizontal (velocity.x) debe ser
	#manejado por los estados individuales (Caminar, Salto, Caida).
	
	if not player.is_on_floor():
		player.velocity.y += gravity * delta
	
	player.move_and_slide()
	return null # El estado base NUNCA decide transiciones por sí mismo

	
