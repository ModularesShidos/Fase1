// -----------------------------
// 1 - Dibujar personajes a los lados
// -----------------------------
draw_set_font(Font1);
var student_x = room_width * 0.15; // Estudiante a la izquierda (15% de la pantalla)
var teacher_x = room_width * 0.9; // Profesor a la derecha (90% de la pantalla)
var sprite_scale = 0.7; // escala de los sprites
var y_pos = room_height - (sprite_get_height(Spr_Big_Player) * sprite_scale / 2) - 5; // altura desde abajo

// Estudiante (izquierda)
draw_sprite_ext(Spr_Big_Player, current_sprite_student, student_x, y_pos, sprite_scale, sprite_scale, 0, c_white, 1);

// Profesor (derecha)
draw_sprite_ext(Spr_Teacher, current_sprite_teacher, teacher_x, y_pos, sprite_scale, sprite_scale, 0, c_white, 1);


// -----------------------------
// 2 - Dibujar objetos
// -----------------------------

// Posición de referencia (arriba de la cabeza del alumno)
var text_x = student_x - 70;
var text_y = y_pos - (sprite_get_height(Spr_Big_Player) * sprite_scale / 2) - 100; 

draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);

// Mostrar "Llamar a un profe" si NO se ha usado
if (!item_call_used) {
    draw_text(text_x, text_y, "[X] Llamar a un profe");
    text_y += 60; // bajar un poco para el siguiente texto
}

// Mostrar "Usar acordeón" si NO se ha usado
if (!item_cheat_used) {
    draw_text(text_x, text_y, "[Z] Usar acordeón");
}


// -----------------------------
// 3 - Dibujar preguntas y opciones
// -----------------------------

if (state == "question" || state == "feedback") {
    var q = questions[question_index];

    // Configuración de alineación
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);

    // -----------------------------
    // Número de pregunta (arriba como título)
    // -----------------------------
    var question_num = "Pregunta " + string(question_index + 1) + " de " + string(max_questions);
    draw_set_color(c_black);
    draw_text(room_width/2, 30, question_num);

    // -----------------------------
    // Pregunta (debajo del título)
    // -----------------------------
    draw_set_color(c_red);
    draw_text(room_width/2, 230, q[0]);

    // -----------------------------
    // Opciones o feedback en el centro
    // -----------------------------
    if (state == "question") {
        var option_count = array_length(q[1]);
        var option_y_start = room_height/2 - (option_count * 60) / 2; // centrado vertical

        for (var i = 0; i < option_count; i++) {
            var option_text = string(i+1) + ") " + q[1][i];

            // Resaltar si está activado el "cheat"
            if (item_cheat_active && item_cheat_question == question_index) {
                if (i == q[2]) draw_set_color(c_green);
                else draw_set_color(c_blue);
            } else {
                draw_set_color(c_blue);
            }

            draw_text(room_width/2, option_y_start + i*50, option_text);
        }
    }
    else if (state == "feedback") {
        draw_set_color(feedback_color);
        draw_text(room_width/2, room_height/2, feedback_text);
    }
}


// -----------------------------
// 4 - Dibujar barra de HP en el bottom
// -----------------------------

var bar_width  = 300;   // ancho total de la barra
var bar_height = 30;    // alto total de la barra
var bar_x = room_width/2 - bar_width/2; // posición X centrada
var bar_y = room_height - 50;           // posición Y un poco arriba del borde

// Reescalar HP para que 100 sea lleno y 50 sea vacío
var hp_percent = (player_hp - 50) / 50;
hp_percent = clamp(hp_percent, 0, 1); // asegurarse de que quede entre 0 y 1

// Fondo de la barra (gris oscuro)
draw_set_color(make_color_rgb(60, 60, 60));
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

// Color de la barra según vida real (no el reescalado)
if (player_hp >= 85) {
    draw_set_color(c_lime); // verde
} else if (player_hp >= 65) {
    draw_set_color(c_yellow); // amarillo
} else {
    draw_set_color(c_red); // rojo
}

// Barra proporcional (usando hp_percent reescalado)
draw_rectangle(bar_x, bar_y, bar_x + (bar_width * hp_percent), bar_y + bar_height, false);

// Borde de la barra (blanco)
draw_set_color(c_white);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, true);

// Texto "HP" arriba de la barra (blanco)
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(c_black);
draw_text(room_width/2, bar_y - 5, "HP");

/*
// Texto con cantidad de vida dentro de la barra (negro)
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_text(room_width/2, bar_y + bar_height/2, string(player_hp));
*/


// -----------------------------
// 5 - Dibujar pantalla final
// -----------------------------

if (state == "end") {
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var result_text;
    if (battle_result == "victoria") result_text = "¡Felicidades! Pasaste el examen :D \n\n PRESIONA E";
    else result_text = "Has reprobado :( \n\n PRESIONA E";

    draw_text(room_width/2, room_height/2, result_text);
}
