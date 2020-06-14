#tool
extends Actor

var push = 10
onready var anim = get_node("Sprite")
#onready var coyote_timer = $cTimer
var velocity = Vector2(0,0)
var snap_normal = Vector2.DOWN setget set_snap_normal
var motion = Vector2()
#var canJump = true

func _physics_process(delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("ui_up") and _velocity.y < 0.0
	var direction = get_direction()
	#var was_on_floor = is_on_floor()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL, false, 4, PI/4, false)
	#velocity = move_and_slide_with_snap(_velocity, snap_normal * 50, FLOOR_NORMAL)
	
	if Input.is_action_pressed("ui_right") and is_on_floor():
		if not $move.is_playing():
			$move.play()
		if Input.is_action_pressed("ui_action"):
			anim.flip_h = false
			anim.play("push")
		if not Input.is_action_pressed("ui_action"):
			anim.flip_h = false
			anim.play("run")
			
	elif Input.is_action_pressed("ui_left") and is_on_floor():
		#coyote_timer.stop()
		if not $move.is_playing():
			$move.play()
		if Input.is_action_pressed("ui_action"):
			anim.flip_h = false
			anim.play("push")
		if not Input.is_action_pressed("ui_action"):
			anim.flip_h = true
			anim.play("run")
	
	elif not is_on_floor():
		if Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right"):
				if $move.is_playing():
					$move.stop()
#		cyoteTime()
		velocity.y = 0
		if Input.is_action_just_pressed("ui_up"):
			$jump.play()
			if Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right"):
				if $move.is_playing():
					$move.stop()

		if Input.is_action_pressed("ui_left"):
			anim.flip_h = true
			anim.play("jump")
			
			#$jump.play()
				
		if Input.is_action_pressed("ui_right"):
			anim.flip_h = false
			anim.play("jump")
			
	else:
		anim.play("idle")
		$move.stop()
		
		
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider is RigidBody2D:
			collision.collider.apply_central_impulse(-collision.normal * push)

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		-1.0 if Input.is_action_just_pressed("ui_up") and is_on_floor() and not Input.is_action_pressed("ui_action") else 1.0 
	)
	
func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool 
	) -> Vector2:
	var out: = linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		out.y = speed.y * direction.y
	if is_jump_interrupted:
		out.y = 0.0 
	return out
	
func death():
	_velocity = Vector2.ZERO
	speed = Vector2.ZERO	
	anim.flip_h = false
	get_node("Sprite").play("death2")# = "death2"
	yield(anim, "animation_finished")
	queue_free()
	if not is_on_wall():
		_velocity = Vector2.ZERO
		speed = Vector2.ZERO	
		anim.flip_h = false
		get_node("Sprite").animation = "deathh"
		yield(anim, "animation_finished")
		queue_free()

func set_snap_normal(new_snap_normal):
	snap_normal = new_snap_normal
	
func jump():
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = 6

#func cyoteTime():
#	yield(get_tree().create_timer(.1), "timeout")
#	canJump = false
#	pass		

