// Alarma 0 
if (array_length(pages) > 0) {
	if (text_on_display != pages[page]) {
	    // 📝 Todavía hay texto que escribir letra por letra
	    text_on_display += string_char_at(pages[page], string_length(text_on_display) + 1);
	    alarm[0] = 3;
	    text_finished = false;
	    show_debug_message("Escribiendo letra -> ahora: " + text_on_display);

	} else {
	    // ✅ El texto ya terminó de escribirse
	    text_finished = true;
	    esperar_input = true;
	}
	
} else {
    show_debug_message("Pages está vacío, no se puede escribir nada");
}
