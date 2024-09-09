extends CharacterBody2D

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
const SPEED = 100.0

func _physics_process(_delta: float) -> void:
	#Pega os inputs do jogador em um Vector, tipo os de GA. Ex: (1, 1), (12, -14)
	var direction := Input.get_vector("Esquerda", "Direita", "Cima", "Baixo")
	velocity = direction.normalized() * SPEED #Aplica na velocidade
	
	move_and_slide()
	animacao()

func animacao():
	if velocity: #Se velocidade não é nula, podemos fazer as contas pra saber qual animação
		if abs(velocity.x) > abs(velocity.y): #Quero saber qual módulo da velocidade é maior
			sprite.play("Lado")
			sprite.flip_h = velocity.x < 0 #Vira o personagem
		else:
			if velocity.y > 0: #Temos que lembrar que na Godot, negativo é pra cima
				sprite.play("Baixo")
			else:
				sprite.play("Cima")
	else:
		sprite.play("Idle")
