// Fondo blanco con transparencia (fade-in)
draw_set_alpha(alpha);
draw_set_color(c_white);
draw_rectangle(0, 0, display_get_width(), display_get_height(), false);

// Texto centrado y más grande
draw_set_alpha(1); // siempre texto opaco
draw_set_color(c_black);

// Aseguramos alineación centrada
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Dibujar texto
draw_text(display_get_width()/2, display_get_height()/2, text);
