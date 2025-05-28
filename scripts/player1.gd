class_name Player

extends CharacterBody2D


@onready var maquina_Estados = $maquinaEstados
@onready var animacion = $AnimationPlayer

func _ready():maquina_Estados.init()

func _process(delta): maquina_Estados.process_frame(delta)

func _physics_process(delta): maquina_Estados.process_physics(delta)

func _input(event): maquina_Estados.process_input(event)
