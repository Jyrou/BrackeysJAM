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

func _physics_process(_delta):
	directionVector = Input.get_vector("left", "right", "up", "down")
	velocity = directionVector.normalized() * SPEED
	move_and_slide()
	

func update_animation():
	if velocity.y < 0:
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
