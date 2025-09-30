// Responder preguntas
if (keyboard_check_pressed(ord("1"))) selected_answer = 0;
if (keyboard_check_pressed(ord("2"))) selected_answer = 1;
if (keyboard_check_pressed(ord("3"))) selected_answer = 2;
if (keyboard_check_pressed(ord("4"))) selected_answer = 3;

// Usar ítems
if (keyboard_check_pressed(ord("Z")) && !item_cheat_used) {
    item_cheat_used = true; // Marca el acordeon como usado
	item_cheat_active = true; // Activa acordeón
	item_cheat_question = question_index; // solo aplica en la pregunta actual
}

if (keyboard_check_pressed(ord("X")) && !item_call_used) {
    item_call_used = true;
    // "Llamar al profe": elimina 2 opciones malas
    var q = questions[question_index];
    var correct = q[2];
    var removed = 0;

    for (var i = 0; i < array_length(q[1]); i++) {
        if (i != correct && removed < 2) {
            q[1][i] = "-----"; // Borra visualmente
            removed++;
        }
    }
    questions[question_index] = q;
}

if(keyboard_check_pressed(ord("E")) && state == "end" && battle_result == "victoria"){
	actualizar_partida_servidor();
	room_goto(Sala_graduado);
}else{
	if(keyboard_check_pressed(ord("E")) && state == "end" && battle_result == "derrota"){
	room_goto(Sala_reprobado);
	}
}
