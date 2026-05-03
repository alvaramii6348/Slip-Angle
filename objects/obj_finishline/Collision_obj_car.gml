if (instance_exists(obj_timer_controller)) {
    if (obj_timer_controller.timer_running) {
        obj_timer_controller.timer_running = false;
        obj_timer_controller.timer_finished = true;
        obj_timer_controller.finish_time = current_time;
        obj_timer_controller.elapsed_time = (obj_timer_controller.finish_time - obj_timer_controller.start_time) / 1000;
    }
}

