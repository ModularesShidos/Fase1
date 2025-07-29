ya_hablo = false;

// Comienza oculto si no ha visto la clase
if (!global.visto_dialogo_clase) {
    visible = false;
    active = false; // <-- variable personalizada para que no hable todavía
} else {
    visible = true;
    active = true;
}
