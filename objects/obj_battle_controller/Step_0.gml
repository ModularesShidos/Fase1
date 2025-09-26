switch(state) {
    case "question":
        if (selected_answer != -1) {
            var correct = questions[question_index][2];

            if (selected_answer == correct) {
                // Correcta
                feedback_text = "¡Correcto!";
                feedback_color = c_green;
                current_sprite_student = 3;
                current_sprite_teacher = 1;
            } else {
                // Incorrecta
                feedback_text = "Incorrecto";
                feedback_color = c_red;
                player_hp -= 7;

                current_sprite_student = 2;
                current_sprite_teacher = 2;
            }

            feedback_timer = feedback_duration; // activa temporizador
            state = "feedback"; // cambia a estado temporal
        }
    break;

    case "feedback":
        // Contador de tiempo
        if (feedback_timer > 0) {
            feedback_timer -= 1;
        } else {
            // Restaurar sprites
            current_sprite_student = 1;
            current_sprite_teacher = 3;

            // Avanzar a la siguiente pregunta o terminar
            if (player_hp < 50) {
                state = "end";
                battle_result = "derrota";
            } else {
                question_index += 1;
                if (question_index >= max_questions) {
                    state = "end";
                    battle_result = "victoria";
                } else {
                    state = "question";
                }
            }
            selected_answer = -1;
        }
    break;

    case "end":
        // No se hace nada, solo Draw
    break;
}
