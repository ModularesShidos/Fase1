if (!text_finished) {
    // Mostrar todo el texto de golpe
    text_on_display = pages[page];
    text_finished = true;
	show_debug_message("Key E -> Completar página al instante: \"" + pages[page] + "\"");
} else {
    // Ya se mostró toda la página actual
    page += 1;
	show_debug_message("Key E -> Avanzar a página: " + string(page));

    if (page < array_length(pages)) {
        text_on_display = "";
        text_finished = false;
        alarm[0] = 3;
    } else {
		show_debug_message("Key E -> Fin diálogo, destruir textbox");
        // Ya terminó todo el texto, destruir textbox
        instance_destroy(); // <--- Aquí desaparece el obj_text_box
    }
}
