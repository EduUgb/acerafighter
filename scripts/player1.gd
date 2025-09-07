class_name Player
extends CharacterBody2D

@onready var maquina_Estados = $maquinaEstados
@onready var animacion = $AnimationPlayer
@onready var abajo: String = "abajo"
@onready var player = $"."

# 🔹 HUD: usa nombre único de escena
@onready var lbl_combo_info: Label = $"../CanvasLayer/infolbl"
@onready var vida:  ProgressBar = $"../CanvasLayer/vidaBar"
@onready var final: CanvasLayer = $"../final"

# 🔹 Cooldown/combo centralizados aquí
var contador_golpes_especiales: int = 0
var max_golpes_instantaneos: int = 1
var cooldown_golpe_especial: float = 10.0
var ultimo_golpe_especial_time: float = -9999.0
var tiempo_ultimo_golpe: float = -9999.0
var tiempo_max_combo: float = 10.0



func _ready() -> void:
	maquina_Estados.init()
	maquina_Estados.dolor.set_gameover_ui(final)

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
	return Input.is_action_pressed(abajo) and player.is_on_floor()

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
	
	if restante == 0:
		return "PLAYER 1:
		GOLPE ESPECIAL LISTO"
	else:
		return "PLAYER 1:
			Especial: %.1f s" % [restante]
