x = clamp(x, sprite_width/2, room_width-sprite_width/2)
y = clamp(y, sprite_height/2, room_height-sprite_height/2)

var throttle = keyboard_check(vk_up);
var brake = keyboard_check(vk_down);
var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);

/// accelerate forward
if (throttle) {
    move_speed += acceleration;
}

/// brake / reverse
if (brake) {
    move_speed -= brake_power;
}

/// natural friction
if (!throttle && !brake) {
    if (move_speed > 0) {
        move_speed -= friction;
        if (move_speed < 0) move_speed = 0;
    }
    else if (move_speed < 0) {
        move_speed += friction;
        if (move_speed > 0) move_speed = 0;
    }
}

/// clamp forward and reverse speed
move_speed = clamp(move_speed, -reverse_speed, max_speed);

/// steering
if (abs(move_speed) > 0.01) {
    var steer_amount = turn_speed * (abs(move_speed) / max_speed);

    // invert steering while reversing
    if (move_speed < 0) {
        steer_amount = -steer_amount;
    }

    if (right) direction -= steer_amount;
    if (left) direction += steer_amount;
}

/// drift movement
motion_dir += angle_difference(direction, motion_dir) * grip;

/// calculate movement
var dx = lengthdir_x(move_speed, motion_dir);
var dy = lengthdir_y(move_speed, motion_dir);

/// horizontal collision
if (!place_meeting(x + dx, y, obj_cone)) {
    x += dx;
} else {
    move_speed = 0;
}

/// vertical collision
if (!place_meeting(x, y + dy, obj_cone)) {
    y += dy;
} else {
    move_speed = 0;
}

/// rotate sprite
image_angle = direction - 90;