var throttle = keyboard_check(ord("W"));
var brake = keyboard_check(ord("S"));
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var ebrake = keyboard_check(vk_space);

/// accelerate forward
if (throttle) {
    move_speed += acceleration;
}

/// brake first, then reverse only when nearly stopped
if (brake) {
    if (move_speed > 0) {
        move_speed -= brake_power;
        
        if (move_speed < 0) {
            move_speed = 0;
        }
    }
    else {
        move_speed -= brake_power * 0.5;
    }
}

if (ebrake && abs(move_speed) > 3 && (left || right)) {
    move_speed *= 0.985;
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

if (abs(move_speed) < 0.03) {
    move_speed = 0;
}

if (move_speed == 0) {
    motion_dir = direction;
}

/// steering
if (abs(move_speed) > 0.01 && spinout_timer <= 0) {
    var steer_input = 0;

    if (left) steer_input += 1;
    if (right) steer_input -= 1;

    var steer_amount = turn_speed * (abs(move_speed) / max_speed);

    if (ebrake && abs(move_speed) > 3 && steer_input != 0) {
        steer_amount *= ebrake_turn_boost;
    }

    if (move_speed < 0) {
        steer_amount = -steer_amount;
    }

    direction += steer_input * steer_amount;
}

/// drift movement
var current_grip = normal_grip;

if (ebrake && abs(move_speed) > 3 && (left || right)) {
    current_grip = ebrake_grip;
}

motion_dir += angle_difference(direction, motion_dir) * current_grip;

// tiremark
var drift_amount = angle_difference(direction, motion_dir);


if (abs(drift_amount) > 14 && abs(move_speed) > 2.5) {
    var rear_dist = 20;
    var tire_offset = 10;

    var back_x = x - lengthdir_x(rear_dist, direction);
    var back_y = y - lengthdir_y(rear_dist, direction);

    var left_x = back_x + lengthdir_x(tire_offset, direction + 90);
    var left_y = back_y + lengthdir_y(tire_offset, direction + 90);

    var right_x = back_x + lengthdir_x(tire_offset, direction - 90);
    var right_y = back_y + lengthdir_y(tire_offset, direction - 90);

    var mark1 = instance_create_layer(left_x, left_y, "Instances", obj_tiremark);
    var mark2 = instance_create_layer(right_x, right_y, "Instances", obj_tiremark);

    mark1.image_angle = motion_dir - 90;
    mark2.image_angle = motion_dir - 90;

    mark1.image_alpha = 0.15;
	mark2.image_alpha = 0.15;

    mark1.image_xscale = 1.2;
    mark2.image_xscale = 1.2;
}

/// calculate movement
var dx = lengthdir_x(move_speed, motion_dir);
var dy = lengthdir_y(move_speed, motion_dir);

/// move car
x += dx;
y += dy;

x = clamp(x, sprite_width/2, room_width-sprite_width/2)
y = clamp(y, sprite_height/2, room_height-sprite_height/2)

/// rotate sprite
image_angle = direction - 90;