if (mostrar_minimapa)
{
    var spr = Spr_MiniMapa1;

    // Tamaño original del minimapa
    var orig_w = sprite_get_width(spr);
    var orig_h = sprite_get_height(spr);

    // Queremos que el mapa ocupe de ancho el 80% de la pantalla
    var target_w = display_get_gui_width() * 1;
    var esc = target_w / orig_w; // escalado proporcional

    // Altura resultante escalada (no te tienes que preocupar por 1080)
    var final_h = orig_h * esc;

    // Centrado horizontal
    var _x = (display_get_gui_width() - target_w) / 2;
    var _y = 10; // margen superior

    draw_sprite_ext(spr, 0, _x, _y, esc, esc, 0, c_white, 1);
}
