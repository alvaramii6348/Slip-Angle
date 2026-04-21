// push cone based on car movement direction

var push_force = other.move_speed * 0.4;

hsp += lengthdir_x(push_force, other.motion_dir);
vsp += lengthdir_y(push_force, other.motion_dir);