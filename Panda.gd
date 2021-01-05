extends KinematicBody2D

export var max_speed: int = 500
var vel: Vector2 = Vector2()

var facing_dir: int = 0

onready var panda_sprite: AnimatedSprite = $AnimatedSprite

func _physics_process(delta: float) -> void:
    # var vel: Vector2 = Vector2()

    if Input.is_action_pressed("move_up"):
        vel.y -= 0.05
    if Input.is_action_pressed("move_down"):
        vel.y += 0.05
    if Input.is_action_pressed("move_left"):
        vel.x -= 0.05
    if Input.is_action_pressed("move_right"):
        vel.x += 0.05

    if abs(vel.x) < 0.05:
        vel.x = 0

    if abs(vel.y) < 0.05:
        vel.y = 0

    if abs(vel.y) > abs(vel.x):
        if vel.y > 0:
            facing_dir = 1
        else:
            facing_dir = 0
    else:
        if vel.x > 0:
            facing_dir = 3
        else:
            facing_dir = 2

    var vel2 = vel * max_speed

    move_and_slide(vel2)

    var moving : bool = vel.length() != 0

    handle_animation(moving)

func handle_animation(moving: bool) -> void:
    var state: String

    if moving:
        state = "Walk"
    else:
        state = "Idle"

    match facing_dir:
        0:
            play_animation(state + "Up")
        1:
            play_animation(state + "Down")
        2:
            panda_sprite.flip_h = true
            play_animation(state + "Side")
        3:
            panda_sprite.flip_h = false
            play_animation(state + "Side")

func play_animation(anim : String) -> void:
    var cur_anim: String = panda_sprite.animation

    if cur_anim != anim:
        panda_sprite.animation = anim
