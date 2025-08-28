show_debug_message("=== KEY E ===");
show_debug_message("page = " + string(page) + " / total = " + string(array_length(pages)));
show_debug_message("Estado: text_finished=" + string(text_finished) + " / esperar_input=" + string(esperar_input));


if (!text_finished) {

    // Mostrar todo el texto de golpe
    text_on_display = pages[page];
    text_finished = true;
    esperar_input = true;
	show_debug_message("Forzado a mostrar texto completo");
    
} else if (text_finished && esperar_input) {

    esperar_input = false;
    page += 1;
	show_debug_message("Pasando a la página " + string(page));

    if (page < array_length(pages)) {
        // Mostrar siguiente página
        text_on_display = "";
        text_finished = false;
        alarm[0] = 3;

    } else {
        // Fin del diálogo
        global.dialogo_activo = false;
		show_debug_message("Fin del diálogo -> destruyendo objeto");
        instance_destroy();
    }
}
