// Duración en steps (180 = 3 seg si room_speed=60)
duration = 180;

// Opacidad inicial (para el fade-in)
alpha = 0;

guardado_realizado = false;

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

draw_set_font(Font3);
