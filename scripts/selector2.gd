extends Node2D

@onready var panel2 = $Panel/Panel2
@onready var panel3 = $Panel/Panel3
@onready var panel5 = $Panel/Panel5

func _ready() -> void:
	panel2.visible = false
	panel3.visible = false
	panel5.visible = false
