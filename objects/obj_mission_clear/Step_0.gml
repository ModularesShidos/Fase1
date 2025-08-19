// Animar el fade-in (entra a blanco poco a poco)
if (alpha < 1) {
    alpha += 0.03; // más bajo = más lento el fade
}

// Reducir duración
duration -= 1;

// Cuando termine el tiempo, destruir y continuar
if (duration <= 0) {
    instance_destroy();
    global.mission_2 = true;
    room_goto(Entrada_Revolucion);
	
}
