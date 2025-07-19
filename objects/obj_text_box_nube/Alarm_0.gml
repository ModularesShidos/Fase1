show_debug_message("⏱️ ALARM0: texto actual = " + text_on_display);

if (text_on_display != pages[page]) {
    text_on_display += string_char_at(pages[page], string_length(text_on_display) + 1);
    alarm[0] = 3;
    text_finished = false;
    show_debug_message("📝 ALARM0: escribiendo letra");
} else {
    text_finished = true;
    esperar_input = true; // ✅ Aquí empieza a permitir avanzar
    show_debug_message("✅ ALARM0: texto terminado, esperando input");
}
