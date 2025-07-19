var _x = 30;
var _y = 280;

draw_sprite(spr_text_box_nube, 0, _x, _y); // Nube de diálogo

draw_set_font(global.textbox_font);
draw_set_color(c_white); // Siempre buena práctica

draw_text_ext(_x + 14, _y + 15, text_on_display, 20, 394);
