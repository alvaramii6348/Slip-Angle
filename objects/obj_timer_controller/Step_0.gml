if (timer_running) {
    elapsed_time = (current_time - start_time) / 1000;
}

// Restart current level after finishing
if (timer_finished && keyboard_check_pressed(ord("R"))) {
    room_restart();
}

// Continue to next room after finishing
if (timer_finished && keyboard_check_pressed(vk_enter)) {
    room_goto_next();
}