if (instance_exists(obj_timer_controller)) {
    if (!obj_timer_controller.timer_running && !obj_timer_controller.timer_finished) {
        obj_timer_controller.timer_running = true;
        obj_timer_controller.start_time = current_time;
        obj_timer_controller.elapsed_time = 0;
        obj_timer_controller.cone_penalties = 0;
    }
}