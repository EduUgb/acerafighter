class_name maquinaEstados
extends Node

var currentEstado: estados

@export var estadoInicial: estados

func init() -> void: cambiaEstado(estadoInicial)
	


func process_frame(delta: float) -> void:
	var nuevoEstado: estados = currentEstado.process_frame(delta)
	if nuevoEstado: cambiaEstado(nuevoEstado)
	
func process_input(event: InputEvent) -> void:
	var nuevoEstado: estados = currentEstado.process_input(event)
	if nuevoEstado: cambiaEstado(nuevoEstado)
	
func process_physics(delta: float) -> void:
	var nuevoEstado: estados = currentEstado.process_physics(delta)
	if nuevoEstado: cambiaEstado(nuevoEstado)
	
func cambiaEstado(nuevoEstado: estados ) -> void:
	if currentEstado: currentEstado.exit()
	currentEstado = nuevoEstado
	currentEstado.enter()
