if (keyboard_check_pressed(ord("R"))) {
    room_goto(rm_tutorial);
}

if (keyboard_check_pressed(vk_escape)) {
    game_end();
}