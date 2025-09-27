draw_clear(c_white);
draw_set_color(c_black);
draw_set_font(Font1);

draw_text(200, 100, "Mi Juego - Menú Principal");

if (global.partida_existente) {
    draw_text(200, 200, "Cargar partida");
} else {
    draw_text(200, 200, "Nueva partida");
}
