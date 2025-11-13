if (keyboard_check_pressed(ord("Q"))) {
    global.textbox_cerrado_manualmente = true;
    global.dialogo_activo = false;
    instance_destroy();
}