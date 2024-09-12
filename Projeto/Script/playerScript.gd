extends CharacterBody2D
class_name Player

var SPEED = 60.0
var directionVector = Vector2.ZERO
var animation = ""
@onready var animatedSprite : AnimatedSprite2D = $AnimatedSprite2D

func _process(_delta):
	if Input.is_action_just_pressed("run"):
		SPEED += 40
		animatedSprite.speed_scale = 1.5
	elif Input.is_action_just_released("run") and SPEED == 100.0:
		SPEED -= 40
		animatedSprite.speed_scale = 1
	update_animation()

#WIP // Não está tão responsivo ainda
func _physics_process(_delta):
	var x_direction = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_direction = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	#if x_direction != 0:
	#	directionVector = Vector2(x_direction, 0)
	#elif y_direction != 0:
	#	directionVector = Vector2(0, y_direction)
	#else:
	#	directionVector = Vector2.ZERO
	if x_direction !=0 or y_direction != 0:
		directionVector = Vector2(x_direction,y_direction)
	else:
		directionVector = Vector2.ZERO
	
	velocity = directionVector.normalized() * SPEED
	move_and_slide()

func update_animation():
	if velocity.y<0 and velocity.x<0:
		animation = "upDiagonal"
		animatedSprite.flip_h = false
	elif velocity.y<0 and velocity.x>0:
		animation = "upDiagonal"
		animatedSprite.flip_h = true
	elif velocity.y>0 and velocity.x<0:
		animation = "downDiagonal"
		animatedSprite.flip_h = false
	elif velocity.y>0 and velocity.x>0:
		animation = "downDiagonal"
		animatedSprite.flip_h = true
	elif velocity.y < 0:
		animation = "up"
	elif velocity.y > 0:
		animation = "down"
	elif velocity.x != 0:
		animation = "side"
		if velocity.x > 0:
			animatedSprite.flip_h = false
		elif velocity.x < 0:
			animatedSprite.flip_h = true
	else:
		animation = "idleDown"
	animatedSprite.play(animation)
	
