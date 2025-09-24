if (keyboard_check_pressed(ord("Q"))) {
    show_debug_message("Key G -> Destruir textbox (manual)");
    global.textbox_cerrado_manualmente = true;
    global.dialogo_activo = false;
    instance_destroy();
}