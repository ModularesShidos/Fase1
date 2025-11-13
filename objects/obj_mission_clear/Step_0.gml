// Animar el fade-in (entra a blanco poco a poco) 
if (alpha < 1) { 
	alpha += 0.03; // más bajo = más lento el fade 
}

if (alpha >= 0.5 && !guardado_realizado) {
    guardado_realizado = true;
    show_debug_message("Realizando autoguardado");
    actualizar_partida_servidor();
}

// Reducir duración 
duration -= 1;

// Cuando termine el tiempo, destruir y continuar
if (duration <= 0) {
	instance_destroy();
	global.mission_2 = true;
	actualizar_partida_servidor();
	room_goto(Entrada_Revolucion);
}

if (duration <= 0 && !global.mission_2) {
	instance_destroy();
}