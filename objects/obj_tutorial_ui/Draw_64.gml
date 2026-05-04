// Tutorial controls UI

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var key_size = 60;
var gap = 8;
var margin = 70;

var space_w = key_size * 3 + gap * 2;
var space_h = 42;

// top-left position
var start_x = margin;
var start_y = 70;

// input checks
var key_w = keyboard_check(ord("W"));
var key_a = keyboard_check(ord("A"));
var key_s = keyboard_check(ord("S"));
var key_d = keyboard_check(ord("D"));
var key_space = keyboard_check(vk_space);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// title
draw_set_color(c_black);
draw_text(start_x + space_w / 2, start_y - 35, "Controls");

// W key
if (key_w) draw_set_color(c_yellow); else draw_set_color(c_dkgray);
draw_rectangle(start_x + key_size + gap, start_y, start_x + key_size + gap + key_size, start_y + key_size, false);
draw_set_color(c_white);
draw_text(start_x + key_size + gap + key_size / 2, start_y + key_size / 2, "W");

// A key
if (key_a) draw_set_color(c_yellow); else draw_set_color(c_dkgray);
draw_rectangle(start_x, start_y + key_size + gap, start_x + key_size, start_y + key_size + gap + key_size, false);
draw_set_color(c_white);
draw_text(start_x + key_size / 2, start_y + key_size + gap + key_size / 2, "A");

// S key
if (key_s) draw_set_color(c_yellow); else draw_set_color(c_dkgray);
draw_rectangle(start_x + key_size + gap, start_y + key_size + gap, start_x + key_size + gap + key_size, start_y + key_size + gap + key_size, false);
draw_set_color(c_white);
draw_text(start_x + key_size + gap + key_size / 2, start_y + key_size + gap + key_size / 2, "S");

// D key
if (key_d) draw_set_color(c_yellow); else draw_set_color(c_dkgray);
draw_rectangle(start_x + (key_size + gap) * 2, start_y + key_size + gap, start_x + (key_size + gap) * 2 + key_size, start_y + key_size + gap + key_size, false);
draw_set_color(c_white);
draw_text(start_x + (key_size + gap) * 2 + key_size / 2, start_y + key_size + gap + key_size / 2, "D");

// Spacebar
var space_x = start_x;
var space_y = start_y + (key_size + gap) * 2;

if (key_space) draw_set_color(c_yellow); else draw_set_color(c_dkgray);
draw_rectangle(space_x, space_y, space_x + space_w, space_y + space_h, false);
draw_set_color(c_white);
draw_text(space_x + space_w / 2, space_y + space_h / 2, "SPACE - E-BRAKE");

// tutorial text under controls
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

draw_set_color(c_black);

var text_x = start_x;
var text_y = space_y + space_h + 25;

draw_text(text_x, text_y, "Use WASD to drive.");
draw_text(text_x, text_y + 25, "Hold SPACE while turning");
draw_text(text_x, text_y + 50, "to use the e-brake.");
draw_text(text_x, text_y + 75, "Practice sliding around cones.");

// reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);