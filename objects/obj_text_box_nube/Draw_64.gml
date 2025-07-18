var _x = 30;
var _y = 280;

draw_sprite(spr_text_box_nube, 0, _x, _y); // Usa un sprite diferente si ya lo creaste

draw_set_font(global.textbox_font);
draw_text_ext(_x +14, _y +15, text_on_display, 20, 394);
