timer_running = false;
timer_finished = false;

start_time = 0;
finish_time = 0;
elapsed_time = 0;

cone_penalties = 0;
penalty_seconds = 2;

if (room == rm_tutorial) {
    level_name = "Tutorial";
}
else if (room == rm_level1) {
    level_name = "Level 1: Figure-8 Course";
}
else if (room == rm_level2) {
    level_name = "Level 2: Technical Slalom";
}
else {
    level_name = room_get_name(room);
}