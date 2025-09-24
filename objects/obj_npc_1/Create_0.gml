dialogo_cerrado = false;

// Timer para eliminar NPC
destruir_timer = -1; // -1 indica que no está activo todavía


// Comienza oculto si no ha visto la clase
if (!global.clase1_vista) {
    visible = false;
    active = false;
} else {
    visible = true;
    active = true;
}
