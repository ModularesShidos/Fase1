// Revisa si ya puede activarse
if (!active && global.visto_dialogo_clase) {
    visible = true;
    active = true;
}

// Si todavía no está activo, no sigue
if (!active) exit;

// Verifica que el jugador esté cerca y presione "E"
if (!ya_hablo && distance_to_object(Obj_Player_M) < 40 && keyboard_check_pressed(ord("E")) && !global.dialogo_activo) {
    
    ya_hablo = true;
    global.dialogo_activo = true;

    // Crear el textbox general
	var _caja_texto = instance_create_layer(x, y - 32, "Instances", obj_text_box_general);

    // Asignar el texto (puedes usar una array si quieres varias páginas)
    _caja_texto.text = "¡Hola! Ya tomaste tu primera clase. Recuerda que el conocimiento es poder.";
}
