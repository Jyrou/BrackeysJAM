extends Area2D
@onready var timer: Timer = $Timer
@onready var mood: Sprite2D = $Sprite2D

#Na _ready enquanto a condiçâo não tiver sido criada (sentar na mesa)
func _ready() -> void:
	const delay = 3 #Definido na chamada da futura função
	timer.wait_time = delay
	timer.start()
func _on_timer_timeout():
	if(mood.frame == 1):
		mood.set_frame(0)
	elif(mood.frame == 0):
		print("Colocar o shake aqui")
