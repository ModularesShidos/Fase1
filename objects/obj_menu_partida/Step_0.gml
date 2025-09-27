// Step Event de obj_menu_partidas (versión correcta)
if (keyboard_check_pressed(ord("Z"))) {
    if (global.partida_existente) {
        // Cargar partida... (esto no cambia)
    } else {
        // No hay partida → inicializar y guardar nueva
        show_debug_message("🆕 Tecla Z presionada: Nueva partida.");
        
        // 1. Resetear todas las variables al estado inicial
        inicializar_variables_juego();
        
        // 2. Enviar esos datos frescos al servidor para crear la partida
        guardar_partida_servidor();
    }
}

// En el evento Step de obj_menu_partidas
if (keyboard_check_pressed(ord("P"))) {
    show_debug_message("PING ---> Enviando petición de prueba al servidor...");
    
    // CORRIGE LA IP AQUÍ
    var test_url = "http://localhost:3000/api/ping";
    http_request(test_url, "GET", ds_map_create(), "");
}