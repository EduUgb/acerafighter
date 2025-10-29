extends Node

var player_data = {
	"gravity": 2500,
	"idleAnima": "",
	"caminarAnima":  "",
	"saltoAnima": "",
	"caidaAnima":  "",
	"agacharseAnima": "",
	"golpeAnima": "",
	"walkagaAnima": "",
	"hitAnima": "",
	"golpeAbajoAnima": "",
	"golpeArribaAnima": "",
	"blockAnima": "",
	"especialAnima3" :""
}

var background_texture: Texture = null

var volumen: float = 1.0 # Almacena el valor lineal (0.0 a 1.0)

const MIN_DB = -40.0 # El valor mínimo deseado en decibelios
const MAX_DB = 0.0   # El valor máximo (volumen completo)

func apply_volume():
	# 1. Mapear el valor lineal de Global al rango de decibelios.
	# lerp(inicio, fin, peso)
	var volumen_db = lerp(MIN_DB, MAX_DB, volumen)
	
	# 2. Aplicar al Bus Master, afectando a TODOS los sonidos.
	var bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_index, volumen_db)
	
	print("Volumen aplicado: ", volumen, " (", volumen_db, " dB)")
