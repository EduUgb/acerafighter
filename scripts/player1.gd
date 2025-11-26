class_name Player
extends CharacterBody2D
@onready var efecto = $CanvasLayer/videos
@onready var maquina_Estados = $maquinaEstados
@onready var animacion = $AnimationPlayer
#@onready var abajo: String = "abajo"

@export var playerId: int = 1
# 🔹 HUD: usa nombre único de escena
@onready var lbl_combo_info: Label = null

var vida_max: float = 100
var vida_actual: float = vida_max

@export var barra_vida: ProgressBar

@onready var final: CanvasLayer = $"../final"


# 🔹 Cooldown/combo centralizados aquí
var contador_golpes_especiales: int = 0
var max_golpes_instantaneos: int = 1
var cooldown_golpe_especial: float = 30.0
var ultimo_golpe_especial_time: float = -9999.0
var tiempo_ultimo_golpe: float = -9999.0
var tiempo_max_combo: float = 30.0

var izquierda: String
var derecha: String
var arriba: String
var abajo: String
var golpe: String
var golpeArriba: String
var golpeespecial: String
var block: String


func _ready() -> void:

	maquina_Estados.init()
	maquina_Estados.dolor.set_gameover_ui(final)
	efecto.visible = false

	await get_tree().process_frame  # 🔹 Espera a que todos los estados existan
	configurar_controles()
	
	if playerId == 1:
		lbl_combo_info = $"../CanvasLayer/infolbl"
	else:
		lbl_combo_info = $"../CanvasLayer/infolbl2"
	
		
func _process(delta: float) -> void:
	maquina_Estados.process_frame(delta)

func _physics_process(delta: float) -> void:
	maquina_Estados.process_physics(delta)

	# Reset combo si pasó mucho tiempo sin golpear
	var now := Time.get_ticks_msec() / 1000.0
	if now - tiempo_ultimo_golpe > tiempo_max_combo:
		contador_golpes_especiales = 0

	# Actualiza HUD SIEMPRE (no se pausa al cambiar de estado)
	if is_instance_valid(lbl_combo_info):
		lbl_combo_info.text = get_combo_info()

func _input(event: InputEvent) -> void:
	maquina_Estados.process_input(event)

func quiere_agacharse() -> bool:
	return Input.is_action_pressed(abajo) and is_on_floor()

# ====== API que usan los estados ======
func puede_usar_golpe_especial() -> bool:
	var now: float = Time.get_ticks_msec() / 1000.0
	if contador_golpes_especiales < 0:
		# Permitir golpe instantáneo la primera vez
		return true
	# Después del límite, aplicar cooldown
	return (now - ultimo_golpe_especial_time) >= cooldown_golpe_especial


func registrar_golpe_especial() -> void:
	var now := Time.get_ticks_msec() / 1000.0
	ultimo_golpe_especial_time = now
	tiempo_ultimo_golpe = now
	contador_golpes_especiales += 1

func reset_combo() -> void:
	contador_golpes_especiales = 0

func get_combo_info() -> String:
	var now: float = Time.get_ticks_msec() / 1000.0
	var restante: float = max(0.0, cooldown_golpe_especial - (now - ultimo_golpe_especial_time))
	var playercombo = "PLAYER %d" % playerId
	if restante == 0:
		return "%s:\nGOLPE ESPECIAL LISTO" % playercombo
	else:
		return "%s:\nEspecial: %.1f s" % [playercombo, restante]
			


	var inicio = maquina_Estados.estadoInicial
	if inicio and animacion.has_animation(inicio.idleAnima):
		animacion.play(inicio.idleAnima)
		animacion.advance(0)


func configurar_controles() -> void:
	# todos los estados que existen en tu máquina
	var estados = [
		maquina_Estados.estadoInicial,
		maquina_Estados.estadoInicial.caminarEstado,
		maquina_Estados.estadoInicial.idleEstado,
		maquina_Estados.estadoInicial.saltoEstado,
		maquina_Estados.estadoInicial.fallEstado,
		maquina_Estados.estadoInicial.golpeEstado,
		maquina_Estados.estadoInicial.bloqueoEstado,
		maquina_Estados.estadoInicial.agacharseEstado
	]

	# --- INPUTS DEL PLAYER ---
	if playerId == 1:
		izquierda = "izquierda"
		derecha = "derecha"
		arriba = "arriba"
		abajo = "abajo"
		golpe = "golpe"
		golpeArriba = "golpeArriba"
		golpeespecial = "especial"
		block = "bloqueo"
	else:
		izquierda = "izquierda2"
		derecha = "derecha2"
		arriba = "arriba2"
		abajo = "abajo2"
		golpe = "golpe2"
		golpeArriba = "golpeArriba2"
		golpeespecial = "especial2"
		block = "bloqueo2"

	# --- MANDAR ESTAS VARIABLES A CADA ESTADO ---
	for st in estados:
		if st == null:
			continue
		st.izquierda = izquierda
		st.derecha = derecha
		st.arriba = arriba
		st.abajo = abajo
		st.golpe = golpe
		st.golpeArriba = golpeArriba
		st.golpeespecial = golpeespecial
		st.block = block

func recibir_dano(cantidad: float) -> void:
	vida_actual = clamp(vida_actual - cantidad, 0, vida_max)

	if barra_vida:
		barra_vida.value = vida_actual
