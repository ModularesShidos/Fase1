if (!instance_exists(Obj_Player_M)) exit;

if (ya_hablo || global.dialogo_activo) {
    exit; // Ya habló o hay otro diálogo activo
}

// Marcar como que ya habló
ya_hablo = true;

// Activar caja de texto 
instance_create_layer(x, y - 32, "GUI", obj_textbox_general);

