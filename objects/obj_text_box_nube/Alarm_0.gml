show_debug_message("⏱️ ALARM0: texto actual = " + text_on_display); 
show_debug_message("⏰ ALARM0 ACTIVADA");
show_debug_message("⌛ Estado antes: text_on_display = \"" + text_on_display + "\", text_finished = " + string(text_finished));

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
	    show_debug_message("✅ ALARM0: texto terminado, esperando input");
	}
	
} else {
    show_debug_message("⚠️ pages está vacío, no se puede escribir nada");
}
