draw_set_alpha(alpha); // Transparencia actual
draw_set_color(c_black); // Color negro
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false); // Rectángulo sobre toda la pantalla
draw_set_alpha(1); // Restaurar para no afectar otros objetos
