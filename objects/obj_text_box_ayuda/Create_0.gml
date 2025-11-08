global.dialogo_activo = true;
switch (global.game_state) {
    case 0:
       text = "¡Apresúrate! Tienes una clase de Programación que comenzará en apenas 5 minutos en el edificio X, salón número 7. No te confíes, porque los pasillos de CUCEI pueden ser un verdadero laberinto y perderte significaría llegar ttarde.";
       break;
    case 1:
        text = "¡Atención! En tan solo 5 minutos dará inicio tu clase de Programación en el edificio X, salón número 12. Será una sesión importante, así que no pierdas tiempo y dirígete cuanto aantes.";
        break;
    case 2: 
        text = "Ahora es momento de dar el siguiente paso: comenzarás con Métodos Matemáticos en el edificio U, salón número 8. No te confíes, el tiempo apremia y debes apresurarte para no llegar ttarde.";
        break;
    case 3: 
        text = "Date prisa y dirígete al edificio X, salón número 2 para tu próxima clase, porque cada minuto cuenta. Mientras avanzas por los pasillos de CUCEI, vale la pena saber que esta facultad fue una de las primeras en México en ofrecer la carrera de Ingeniería Informática.";
        break;
    case 4: 
        text = "Hoy tienes clase del edificio X, salón número 8. Apresúrate para no llegar tarde y aprovechar cada mminuto.";
        break;
    case 5: 
        text = "¡Rápido! Tu profesor te espera para tu examen final, y tendrás que demostrar que prestaste atención a todas tus clases. Busca dirigirte cuanto antes al edificio X aula  17 para no llegar ttarde.";
        break;
    default:
        text = "Sin diálogo definido.";
        break;
}

// Limpiar texto
text = string_replace_all(text, chr(9), " ");
while (string_pos("  ", text) != 0) text = string_replace_all(text, "  ", " ");

// Dividir en páginas (por si acaso algún texto es muy largo)
pages = scr_split_text_into_pages(text, Font3, 22, 380, 185);
page = 0;
text_on_display = pages[page]; // ← ¡TEXTO COMPLETO INMEDIATAMENTE!
text_finished = true; // ← ¡YA ESTÁ TERMINADO!

show_debug_message("Textbox ayuda creado - Texto: " + text);