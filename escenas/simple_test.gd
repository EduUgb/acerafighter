extends SimpleTest

const  PlayerIdleStates = preload("res://scripts/Idle.gd")

#stubs o clases internas que necesita

class playeranimationstub:
	extends Object
	var llamadoDelPlay = false
	var animacioncapturada = ""
	func play(aniamcionNombre: String) -> void:
		self.llamadoDelPlay = true
		self.animacioncapturada = aniamcionNombre
		
		
#simulando el player que es su dependencia
class playerstub:
	extends Player
	#clase anterior
	var animation: playeranimationstub
	
	func _init():
		self.animacion = playeranimationstub.new()
		
		
#configuracion del entorno de las pruebas
#nombre de la class
var idletest :  PlayerIdleStates
var playerst : playerstub
var playeranimationst : playeranimationstub

func before_each():
	#instanciar los st
	playerst = playerstub.new()
	
	
	
	playeranimationst = playerst.animacion
	
	idletest =  PlayerIdleStates.new()
	idletest.player = playerst
	
	#nombre de la aniamtion :p
	
	idletest.idleAnima = "animacionidle"
	
func after_each():
	#reiniciar el estado que capturamos
	playeranimationst.llamadoDelPlay = false
	playeranimationst.animacioncapturada = ""
	
	
#funcion de prueba
func test_enter_reproduce_animacion_correcta():
	#arrange
	var animacionEsperada = "animacionidle"

	#act
	idletest.enter()
	
	#assert
	#1 Fue el metodo play llamado?
	expect(playeranimationst.llamadoDelPlay).to.be_true("enter() debe llamar a player.animacion.play()")
	
	#2 fue llamado el argumento que queremos?
	expect(playeranimationst.animacioncapturada).to.be_equal_to(animacionEsperada, "La animación reproducida debe ser la definida en idleAnima.")
	
	
	
