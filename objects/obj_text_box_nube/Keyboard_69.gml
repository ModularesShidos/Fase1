if (!text_finished) {
    // ⏩ Mostrar texto completo inmediatamente
    text_on_display = pages[page];
    text_finished = true;
    esperar_input = true; // Esperar a que el jugador presione E de nuevo
    show_debug_message("🟨 TECLA E: texto incompleto, se muestra completo");
} else if (esperar_input) {
    // ✅ Solo avanzamos si ya terminó de escribirse
    esperar_input = false;

    page += 1;

    if (page < array_length(pages)) {
        text_on_display = "";
        text_finished = false;
        alarm[0] = 3;
        show_debug_message("🟩 TECLA E: pasando a la siguiente página");
    } else {
        show_debug_message("🟥 TECLA E: terminando diálogo y destruyendo");
        instance_destroy(); // Diálogo terminado
    }
}
