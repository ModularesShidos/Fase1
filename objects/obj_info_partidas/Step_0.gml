// Actualizar texto basado en la lista de partidas
if (variable_struct_exists(global, "lista_partidas") && ds_list_size(global.lista_partidas) > 0) {
    texto_info = "";
    
    for (var i = 0; i < ds_list_size(global.lista_partidas); i++) {
        var partida = ds_list_find_value(global.lista_partidas, i);
        
        if (partida.existe) {
            // 🔥 FORMATEAR FECHA BONITA
            var fecha_bonita = "Fecha no disponible";
            if (partida.fecha_guardado != "No guardado") {
                // Convertir fecha ISO a formato legible
                var fecha_raw = partida.fecha_guardado;
                if (string_pos("T", fecha_raw) > 0) {
                    var partes = string_split(fecha_raw, "T");
                    fecha_bonita = partes[0] + " " + string_copy(partes[1], 1, 8);
                } else {
                    fecha_bonita = fecha_raw;
                }
            }
            
            texto_info += "🎮 Partida Guardada " + string(partida.id) + " | ";
            texto_info += "Misión: " + string(partida.game_state) + " | ";
            texto_info += "Último guardado: " + fecha_bonita + "#";
            
        } else {
            texto_info += "📭 Slot " + string(partida.id) + " vacío#";
        }
    }
}