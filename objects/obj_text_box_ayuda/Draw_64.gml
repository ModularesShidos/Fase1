draw_set_alpha(1);
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(Font3);

var _x = 30;
var _y = 280;

draw_sprite(spr_text_box_cel, 0, _x, _y);
draw_set_font(Font3);
draw_set_color(c_black);
draw_text_ext(30 +26, 280 +15, text_on_display, 20, 380);    