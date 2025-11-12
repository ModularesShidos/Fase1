if (keyboard_check_pressed(ord("Z"))) {
    if (global.partida_existe) {
        // Cargar
        global.id_partida = 1;
        cargar_partida_servidor();
        room_goto(Entrada_Revolucion); 
    } else {
        // Crear nueva
        inicializar_variables_juego();
        global.id_partida = 1;
        guardar_partida_servidor();
        room_goto(Entrada_Revolucion); 
    }
}
