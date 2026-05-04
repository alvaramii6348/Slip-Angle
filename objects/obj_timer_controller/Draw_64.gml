var gui_w = display_get_gui_width();

var center_x = gui_w / 2;
var top_y = 25;

var penalty_time = cone_penalties * penalty_seconds;
var total_time = elapsed_time + penalty_time;

// HUD text settings
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);

var title_scale = 1.3;
var big_scale = 2.0;
var med_scale = 1.3;

// Level name always at top
draw_text_transformed(center_x, top_y, level_name, title_scale, title_scale, 0);

if (!timer_running && !timer_finished) {
    draw_text_transformed(center_x, top_y + 45, "Drive through the start gate to begin.", med_scale, med_scale, 0);
    draw_text_transformed(center_x, top_y + 90, "Cone Penalties: 0", med_scale, med_scale, 0);
}
else if (timer_running) {
    draw_text_transformed(center_x, top_y + 45, "TIME: " + string_format(elapsed_time, 1, 2), big_scale, big_scale, 0);
    draw_text_transformed(center_x, top_y + 115, "Cones: " + string(cone_penalties) + "   Penalty: +" + string(penalty_time) + "s", med_scale, med_scale, 0);
}
else if (timer_finished) {
    draw_text_transformed(center_x, top_y + 45, "FINISHED!", big_scale, big_scale, 0);
    draw_text_transformed(center_x, top_y + 110, "Final Time: " + string_format(total_time, 1, 2), med_scale, med_scale, 0);
    draw_text_transformed(center_x, top_y + 150, "Raw: " + string_format(elapsed_time, 1, 2) + "   Cones: " + string(cone_penalties) + "   Penalty: +" + string(penalty_time) + "s", med_scale, med_scale, 0);

    draw_text_transformed(center_x, top_y + 205, "Press R to restart", med_scale, med_scale, 0);
    draw_text_transformed(center_x, top_y + 240, "Press ENTER to continue", med_scale, med_scale, 0);
}

// reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);