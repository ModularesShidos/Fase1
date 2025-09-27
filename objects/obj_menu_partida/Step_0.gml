// Step Event
if (keyboard_check_pressed(ord("Z"))) {

    if (global.partida_existente) {
        // Ya hay partida guardada → cargar y entrar
        show_debug_message("📥 Tecla Z presionada: Cargar partida. Solicitando datos al servidor...");
        cargar_partida_servidor();
        // NO room_goto aquí: esperar respuesta en obj_system
    } else {
        // No hay partida → inicializar nueva
        show_debug_message("🆕 Tecla Z presionada: Nueva partida. Inicializando variables...");
        //inicializar_variables_juego(); 
        guardar_partida_servidor(); // POST al servidor
        show_debug_message("🟢 Nueva partida: enviando datos al servidor...");
    }

}
