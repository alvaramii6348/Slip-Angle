var throttle = keyboard_check(vk_up)
var brake = keyboard_check(vk_down)
var left = keyboard_check(vk_left)
var right = keyboard_check(vk_right)

if (throttle) {
    move_speed += acceleration
}

if (brake) {
    move_speed -= brake_power
}

if (!throttle && !brake) {

    if (move_speed > 0) {
        move_speed -= friction
    }

    if (move_speed < 0) {
        move_speed += friction
    }

}

move_speed = clamp(move_speed, -max_speed, max_speed)

if (abs(move_speed) < 0.01) {
    move_speed = 0
}

//steering only works when moving
if (move_speed != 0) {

    if (right) {
        direction -= 3
    }

    if (left) {
        direction += 3
    }

}

speed = move_speed

image_angle = direction - 90