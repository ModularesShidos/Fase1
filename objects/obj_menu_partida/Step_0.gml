if (keyboard_check_pressed(ord("Z"))) {
    if (global.partida_existe) {
        // Cargar
        show_debug_message("📥 Cargando partida ID 1");
        global.id_partida = 1;
        cargar_partida_servidor();
        room_goto(Entrada_Revolucion); // <-- Aquí SÍ va el cambio de room
    } else {
        // Crear nueva
        show_debug_message("🆕 Creando nueva partida en ID 1");
        inicializar_variables_juego();
        global.id_partida = 1;
        guardar_partida_servidor();
        room_goto(Entrada_Revolucion); // <-- Aquí también
    }
}
