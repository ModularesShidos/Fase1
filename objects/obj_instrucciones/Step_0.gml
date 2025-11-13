if (global.mostrar_controles) {
    mostrar_tiempo -= 1;
    if (mostrar_tiempo <= 0) {
        global.mostrar_controles = false;
        global.mostrar_controles_visto = true; // Marcar como ya visto
    }
}
	