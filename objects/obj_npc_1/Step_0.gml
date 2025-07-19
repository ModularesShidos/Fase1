// Solo puede hablar si ya acabaste la clase y no has hablado con él
if (global.visto_dialogo_clase && !global.hablo_con_npc_programador) {
    // Solo si el jugador está cerca (ajusta distancia si gustas)
    if (distance_to_object(obj_player) < 40 && keyboard_check_pressed(ord("E"))) {
        
        // ✅ Activar la bandera de que ya habló
        global.hablo_con_npc_programador = true;

        // ✅ Crear el textbox de diálogo
        instance_create_layer(x, y - 32, "GUI", obj_textbox_nube);

        // ✅ Activar bandera para pausar juego o movimiento
        global.dialogo_activo = true;
    }
}


// Si ya habló, lo hacemos desaparecer
if (global.hablo_con_npc_programador) {
    instance_destroy();
}
