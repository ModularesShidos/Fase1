
if (variable_instance_exists(global, "datos_partidas")) {
    var datos = global.datos_partidas;
    
    draw_set_font(-1);
    draw_set_color(c_black);
    draw_set_halign(fa_left);
	draw_set_font(Font6)
    
    var pos_y = [560, 757, 944];
    
    if (is_struct(datos) && struct_exists(datos, "partidas")) {
        var partidas = datos.partidas;
        
        for (var i = 0; i < array_length(partidas); i++) {
            var partida = partidas[i];
            var slot_index = partida.id_partida - 1; // Convertir id_partida a índice (1→0, 2→1, 3→2)
            
            if (slot_index >= 0 && slot_index < 3) {
                // SUMAR 1 al game_state para mostrar Misión 1, 2, 3, etc
                var mision_mostrar = partida.game_state + 1;
                draw_text(500, pos_y[slot_index], "Misión: " + string(mision_mostrar));
            }
        }
        
        // Mostrar "Nueva" para slots vacíos
        for (var i = 1; i <= 3; i++) {
            var slot_ocupado = false;
            for (var j = 0; j < array_length(partidas); j++) {
                if (partidas[j].id_partida == i) {
                    slot_ocupado = true;
                    break;
                }
            }
            if (!slot_ocupado) {
                draw_text(500, pos_y[i-1], "Misión: Nueva");
            }
        }
    }
} else {
    draw_set_font(-1);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_text(500, 550, "Cargando...");
}