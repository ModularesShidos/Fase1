function useContactoProfe() {
    if (!item_cheat_used) {
        item_cheat_used = true;

        // Selecciona la respuesta correcta automáticamente
        selected_answer = questions[question_index][2];

        // Activa el cheat para resaltar la correcta
        item_cheat_active = true;
        item_cheat_question = question_index;

        // Inicia el temporizador
        cheat_timer = cheat_duration;

        show_message("Usaste el contacto del profe! La respuesta correcta está resaltada en amarillo.");
    }
}
