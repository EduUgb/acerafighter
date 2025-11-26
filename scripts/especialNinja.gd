extends PlayerState

@onready var numeros = $"../cvtime"
@onready var video1 = $video1
@onready var animaciones1 = $"../CharacterBody2D2/AnimationPlayer"

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	player.animaciones1("prueba")
