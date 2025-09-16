switch(state) {
	case "question":
	    if (item_cheat_active && cheat_timer > 0) {
	        // Solo restamos el temporizador del cheat
	        cheat_timer -= 1;
	        if (cheat_timer <= 0) {
	            // Cuando termina el tiempo, pasamos a feedback
	            var correct = questions[question_index][2];
	            feedback_text = "¡Correcto!";
	            feedback_color = c_green;
	            current_sprite_student = 3;
	            current_sprite_teacher = 1;

	            feedback_timer = feedback_duration;
	            state = "feedback";

	            // Desactivamos el cheat
	            item_cheat_active = false;
	        }
	    }
	    else if (!item_cheat_active && selected_answer != -1) {
	        // Respuesta normal sin cheat
	        var correct = questions[question_index][2];
	        if (selected_answer == correct) {
	            feedback_text = "¡Correcto!";
	            feedback_color = c_green;
	            current_sprite_student = 3;
	            current_sprite_teacher = 1;
	        } else {
	            feedback_text = "Incorrecto";
	            feedback_color = c_red;
	            player_hp -= 7;
	            current_sprite_student = 2;
	            current_sprite_teacher = 2;
	        }
	        feedback_timer = feedback_duration;
	        state = "feedback";
	    }
	break;



    case "feedback":
        // Contador de tiempo
        if (feedback_timer > 0) {
            feedback_timer -= 1;
        } else {
            // Restaurar sprites
            current_sprite_student = 1;
            current_sprite_teacher = 1;

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
