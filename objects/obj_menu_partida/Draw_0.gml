// obj_menu_partidas - Evento Dibujar
draw_clear(c_white);
draw_set_color(c_black);
draw_set_font(Font1);

draw_text(200, 50, "Mi Juego - Menú Principal");

if (global.partida_existe) {
    draw_set_color(c_green);
    draw_text(200, 150, "Partida guardada encontrada");
    draw_text(200, 180, "Presiona Z para CARGAR");
} else {
    draw_set_color(c_red);
    draw_text(200, 150, "No hay partida guardada");
    draw_text(200, 180, "Presiona Z para CREAR nueva partida");
}
