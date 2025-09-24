draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(global.textbox_font);

var _x = 30;
var _y = 280;

draw_sprite(spr_text_box_cel, 0, _x, _y);
draw_set_font(global.textbox_font);
draw_set_color(c_white);
draw_text_ext(30 +14, 280 +15, text_on_display, 20, 394);    