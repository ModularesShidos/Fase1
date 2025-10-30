if (visible && texto_info != "") {
    // Configurar fuente y color
    draw_set_font(fnt_main);  // Usa tu fuente
    draw_set_color(c_black);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    // Dividir el texto en líneas
    var lineas = string_split(texto_info, "#");
    
    // Dibujar cada línea
    for (var i = 0; i < array_length(lineas); i++) {
        if (lineas[i] != "") {
            draw_text(x, y + (i * 25), lineas[i]);
        }
    }
}