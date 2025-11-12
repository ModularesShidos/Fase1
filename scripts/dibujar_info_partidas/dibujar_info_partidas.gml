// Script: dibujar_info_partidas (VERSIÓN CORREGIDA)
function dibujar_info_partidas() {
    // Posiciones donde dibujar la info de cada slot
    var posiciones = [
        {x: 100, y: 200},  // Slot 1
        {x: 100, y: 300},  // Slot 2  
        {x: 100, y: 400}   // Slot 3
    ];
    
    // Verificar si tenemos datos de partidas de forma segura
    if (!variable_instance_exists(global, "datos_partidas")) {
        // Si no existen datos, mostrar mensaje de carga
        draw_text(100, 150, "Cargando información de partidas...");
        return;
    }
    
    var datos = global.datos_partidas;
    
    // Verificar que datos tenga la estructura esperada
    if (!is_struct(datos) || !variable_instance_exists(datos, "slots")) {
        draw_text(100, 150, "Error cargando partidas");
        return;
    }
    
    // Dibujar información para cada slot
    for (var i = 1; i <= 3; i++) {
        var slot = datos.slots[i];
        var pos = posiciones[i-1];
        
        // Verificar si el slot existe y tiene datos
        if (is_struct(slot) && slot.existe == true) {
            // Partida existente - mostrar info detallada
            draw_text(pos.x, pos.y, "PARTIDA " + string(i));
            draw_text(pos.x, pos.y + 30, "Progreso Misión: " + string(slot.game_state));
            draw_text(pos.x, pos.y + 60, "Fuentes: " + string(slot.fuentes_cont ?? 0));
            
            // Mostrar estado de misión principal
            var estado_texto = "En progreso";
            if (slot.mision_terminada == 1) estado_texto = "Completada";
            draw_text(pos.x, pos.y + 90, "Estado: " + estado_texto);
            
            // Dibujar botón visual
            draw_rectangle(pos.x - 10, pos.y - 10, pos.x + 300, pos.y + 110, false);
        } else {
            // Slot vacío
            draw_text(pos.x, pos.y, "PARTIDA " + string(i) + " - VACÍA");
            draw_text(pos.x, pos.y + 30, "Clic para nueva partida");
            
            // Dibujar botón visual para slot vacío
            draw_rectangle(pos.x - 10, pos.y - 10, pos.x + 300, pos.y + 60, false);
        }
    }
}