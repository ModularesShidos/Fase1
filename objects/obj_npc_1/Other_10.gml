if (ya_hablo || global.dialogo_activo) {
    exit; // Ya habló o hay otro diálogo activo
}

// Marcar como que ya habló
ya_hablo = true;

// Activar caja de texto 
instance_create_layer(x, y - 32, "GUI", obj_textbox_general);

// (Opcional) Personaliza el texto desde aquí, si usas variables
with (instance_nearest(x, y - 32, obj_textbox_nube)) {
    text = "¡Hola! Ya tomaste tu primera clase. Recuerda que el conocimiento es poder.";
}
