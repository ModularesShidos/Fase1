//OBJ_TEXTBOX DIBUJAR GUI

var _x = 30;
var _y = 280;

draw_sprite(spr_text_box_cel, 0, _x, _y);

// Permite crear una fuente nueva (la que hicimos)
draw_set_font(global.textbox_font);

/* 
   Dibujar el texto con el tamaño de separacion de los bordes
   el texto, la separacion entre linea y el limite
*/
draw_text_ext(_x +14, _y +15, text_on_display, 20, 394);
