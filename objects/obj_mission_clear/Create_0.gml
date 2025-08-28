// Duración en steps (ej. 180 = 3 seg si room_speed=60)
duration = 180;

// Opacidad inicial (para el fade-in)
show_debug_message("MISION TERMINADA: " + string(global.mision_terminada)); 
alpha = 0;
switch (global.mision_terminada) {
    case 1:
        text = "¡Felicidades!\nCompletaste tu primera misión en CUCEI.";
        break;

    case 2:
        text = "¡Felicidades!\nCompletaste tu segunda misión en CUCEI.";
        break;

    default:
        text = "Sin diálogo definido.";
        break;
}

// Tamaño de la fuente (puedes cambiarlo desde aquí)
draw_set_font(global.textbox_font);
