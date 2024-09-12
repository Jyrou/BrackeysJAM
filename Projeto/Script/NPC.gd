extends Area2D
@onready var timer: Timer = $Timer
@onready var mood: AnimatedSprite2D = $AnimatedSpriteMood
@onready var typemood : int = 0
#Na _ready enquanto a condiçâo não tiver sido criada (sentar na mesa)
func _ready() -> void:
	const delay = 3 #Definido na chamada da futura função
	timer.wait_time = delay
	timer.start()
	
func _on_timer_timeout():
	if(typemood==0):
		mood.play("trocaBle")
		typemood+=1
	elif(typemood == 1):
		print("Colocar o shake aqui")
