// push cone based on car movement direction

var push_force = other.move_speed * 0.4;

hsp += lengthdir_x(push_force, other.motion_dir);
vsp += lengthdir_y(push_force, other.motion_dir);

if (!penalty_given && instance_exists(obj_timer_controller)) {
    if (obj_timer_controller.timer_running) {
        obj_timer_controller.cone_penalties += 1;
        penalty_given = true;
    }
}