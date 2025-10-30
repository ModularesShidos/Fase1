global.dialogo_activo = true;
text = "¡Gracias por tu respuesta!";
pages = scr_split_text_into_pages(text, Font3, 24, 394, 190);
page = 0;
text_on_display = "";
text_finished = false;
alarm[0] = 2; // Más rápido