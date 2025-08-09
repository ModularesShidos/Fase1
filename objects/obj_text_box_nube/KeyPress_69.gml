if (!text_finished) {

    // Mostrar todo el texto de golpe
    text_on_display = pages[page];
    text_finished = true;
    esperar_input = true;
    
} else if (text_finished && esperar_input) {

    esperar_input = false;
    page += 1;

    if (page < array_length(pages)) {
        // Mostrar siguiente página
        text_on_display = "";
        text_finished = false;
        alarm[0] = 3;

    } else {
        // Fin del diálogo
        global.dialogo_activo = false;
        instance_destroy();
    }
}
