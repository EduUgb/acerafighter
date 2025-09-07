class_name maquinaEstados
extends Node

var currentEstado: estados

@export var estadoInicial: estados
@onready var dolor = $dolor


func init() -> void: cambiaEstado(estadoInicial)
	


func process_frame(delta: float) -> void:
	var nuevoEstado: estados = currentEstado.process_frame(delta)
	if nuevoEstado: cambiaEstado(nuevoEstado)
	
func process_input(event: InputEvent) -> void:
	var nuevoEstado: estados = currentEstado.process_input(event)
	if nuevoEstado: cambiaEstado(nuevoEstado)
	
func process_physics(delta: float) -> void:
	var nuevo_estado = currentEstado.process_physics(delta)
	
	if nuevo_estado != null and nuevo_estado != currentEstado:
		cambiaEstado(nuevo_estado)
	
func cambiaEstado(nuevo_estado: estados) -> void:
	if currentEstado != null:
		currentEstado.exit()
	currentEstado = nuevo_estado
	currentEstado.enter()
