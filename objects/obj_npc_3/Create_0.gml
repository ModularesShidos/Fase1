dialogo_cerrado = false;

// Timer para eliminar NPC
destruir_timer = -1; // -1 indica que no está activo todavía

// Comienza oculto si no ha visto la clase
if (!global.clase3_vista) {
    visible = false;
    active = false;
	show_debug_message("CLASE NO VISTAAAAAAAAAAAAAAAAAA");
} else {
    visible = true;
    active = true;
	show_debug_message("CLASE VISTAAAAAAAAAAAAAAAAAA");
}
