if (!text_finished) {
    show_debug_message("🟨 TECLA E PRESIONADA — texto NO terminado");
    show_debug_message("➡️ Antes: text_on_display = \"" + text_on_display + "\"");

    // Mostrar todo el texto de golpe
    text_on_display = pages[page];
    text_finished = true;
    esperar_input = true;

    show_debug_message("🟨 Después: texto COMPLETO mostrado: \"" + text_on_display + "\"");
    show_debug_message("🟨 esperar_input = " + string(esperar_input));
    
} else if (text_finished && esperar_input) {
    show_debug_message("🟩 TECLA E PRESIONADA — texto YA terminado, esperando avanzar");

    esperar_input = false;
    page += 1;

    show_debug_message("📄 Página actual ahora: " + string(page) + " de " + string(array_length(pages)));

    if (page < array_length(pages)) {
        // Mostrar siguiente página
        text_on_display = "";
        text_finished = false;
        alarm[0] = 3;

        show_debug_message("🟩 ALARM REINICIADA para mostrar la siguiente página");
    } else {
        // Fin del diálogo
        global.dialogo_activo = false;
        show_debug_message("🟥 FIN del diálogo — se destruye el objeto");
        instance_destroy();
    }
}
