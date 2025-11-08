var _x = 30;
var _y = 280;

// Fondo
draw_sprite(spr_text_box_cel, 0, _x, _y);

// Pregunta
draw_set_font(Font3);
draw_set_color(c_black);
draw_text_ext(_x + 26, _y + 15, "¿Te gustó esta clase?", 24, 394);

// Instrucciones simples
draw_text_ext(_x + 26, _y + 70, "Presiona S para SÍ    |    Presiona N para NO", 24, 394);