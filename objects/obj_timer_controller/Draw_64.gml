var gui_w = display_get_gui_width();

var center_x = gui_w / 2;
var top_y = 35;

var penalty_time = cone_penalties * penalty_seconds;
var total_time = elapsed_time + penalty_time;

// bigger HUD text
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);

// optional scale variables
var big_scale = 2.0;
var med_scale = 1.3;

if (!timer_running && !timer_finished) {
    draw_text_transformed(center_x, top_y, "Drive through the start gate to begin.", med_scale, med_scale, 0);
    draw_text_transformed(center_x, top_y + 45, "Cone Penalties: 0", med_scale, med_scale, 0);
}
else if (timer_running) {
    draw_text_transformed(center_x, top_y, "TIME: " + string_format(elapsed_time, 1, 2), big_scale, big_scale, 0);
    draw_text_transformed(center_x, top_y + 65, "Cones: " + string(cone_penalties) + "   Penalty: +" + string(penalty_time) + "s", med_scale, med_scale, 0);
}
else if (timer_finished) {
    draw_text_transformed(center_x, top_y, "FINISHED!", big_scale, big_scale, 0);
    draw_text_transformed(center_x, top_y + 60, "Final Time: " + string_format(total_time, 1, 2), med_scale, med_scale, 0);
    draw_text_transformed(center_x, top_y + 100, "Raw: " + string_format(elapsed_time, 1, 2) + "   Cones: " + string(cone_penalties) + "   Penalty: +" + string(penalty_time) + "s", med_scale, med_scale, 0);

    draw_text_transformed(center_x, top_y + 155, "Press R to restart", med_scale, med_scale, 0);
    draw_text_transformed(center_x, top_y + 190, "Press ENTER to continue", med_scale, med_scale, 0);
}

// reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);