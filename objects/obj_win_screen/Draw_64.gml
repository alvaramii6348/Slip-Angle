var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// background
draw_set_color(make_color_rgb(70, 70, 70));
draw_rectangle(0, 0, gui_w, gui_h, false);

// title shadow
draw_set_color(c_black);
draw_text_transformed(gui_w / 2 + 4, gui_h / 2 - 160 + 4, "COURSE COMPLETE!", 3, 3, 0);

// title
draw_set_color(c_yellow);
draw_text_transformed(gui_w / 2, gui_h / 2 - 160, "COURSE COMPLETE!", 3, 3, 0);

// message
draw_set_color(c_white);
draw_text_transformed(gui_w / 2, gui_h / 2 - 60, "You completed all Slip Angle courses.", 1.4, 1.4, 0);
draw_text_transformed(gui_w / 2, gui_h / 2 - 20, "Clean runs and fewer cones mean faster times.", 1.2, 1.2, 0);

// controls
draw_text_transformed(gui_w / 2, gui_h / 2 + 90, "Press R to restart", 1.4, 1.4, 0);
draw_text_transformed(gui_w / 2, gui_h / 2 + 135, "Press ESC to quit", 1.4, 1.4, 0);

// credits
draw_text(gui_w / 2, gui_h - 60, "Created by Isaiah Alvarado-Ramirez");

// reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);