if (fading_in) {
    alpha += 0.05;
    if (alpha >= 1) {
        alpha = 1;
        fading_in = false;
        alarm[0] = espera;
    }
}

if (fading_out) {
    alpha -= 0.05;
    if (alpha <= 0) {
        alpha = 0;
        instance_destroy(); // Eliminar cuando termina el fade
    }
}
