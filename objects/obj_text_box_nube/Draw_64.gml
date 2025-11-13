// Dibujar gui
draw_set_alpha(1);
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(Font3);

var _x = 30;
var _y = 280;

draw_sprite(spr_text_box_nube, 0, _x, _y); // Nube de diálogo

draw_set_font(Font3);
draw_set_color(c_black); // Siempre buena práctica

draw_text_ext(_x + 14, _y + 15, text_on_display, 20, 390);


