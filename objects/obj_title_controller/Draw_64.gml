var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// background
draw_set_color(make_color_rgb(80, 80, 80));
draw_rectangle(0, 0, gui_w, gui_h, false);

// title
draw_set_color(c_black);
draw_text_transformed(gui_w / 2 + 4, gui_h / 2 - 190 + 4, "SLIP ANGLE", 4, 4, 0);

draw_set_color(c_white);
draw_text_transformed(gui_w / 2, gui_h / 2 - 190, "SLIP ANGLE", 4, 4, 0);

// subtitle
draw_set_color(c_black);
draw_text_transformed(gui_w / 2, gui_h / 2 - 90, "A Top-Down Autocross Game", 1.5, 1.5, 0);

draw_sprite_ext(spr_car, 0, gui_w / 2, gui_h / 2 + 130, 2, 2, 45, c_white, 1);

// controls
draw_set_color(c_white);
draw_text_transformed(gui_w / 2, gui_h / 2 + 10, "WASD - Drive", 1.2, 1.2, 0);
draw_text_transformed(gui_w / 2, gui_h / 2 + 45, "SPACE - E-Brake", 1.2, 1.2, 0);
draw_text_transformed(gui_w / 2, gui_h / 2 + 80, "Avoid cones. Fastest time wins.", 1.2, 1.2, 0);

// blinking prompt
if ((blink_timer div 30) mod 2 == 0) {
    draw_set_color(c_yellow);
    draw_text_transformed(gui_w / 2, gui_h / 2 + 170, "PRESS ENTER TO BEGIN", 1.6, 1.6, 0);
}

// credits
draw_set_color(c_white);
draw_text(gui_w / 2, gui_h - 60, "Created by Isaiah Alvarado-Ramirez");

// reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);