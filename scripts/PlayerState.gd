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


#establece estados
@export_group("States")
@export var idleEstado: PlayerState
@export var caminarEstado: PlayerState
@export var saltoEstado: PlayerState
@export var fallEstado: PlayerState
@export var agacharseEstado: PlayerState
@export var golpeEstado: PlayerState
@export var dolorEstado: PlayerState
#input keys


var izquierda: String="izquierda"
var derecha: String="derecha"
var arriba: String="arriba"
var abajo: String= "abajo"

var izquierda2: String="izquierda2"
var derecha2: String="derecha2"
var arriba2: String="arriba2"
var abajo2: String= "abajo2"

var golpe: String = "golpe"
#base

func process_physics(delta: float) -> estados:
	if(player.velocity.y < 0): return fallEstado
	player.velocity.y += gravity * delta
	player.move_and_slide()
	return null
	
	
