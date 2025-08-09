// Revisa si ya puede activarse
if (!active && global.visto_dialogo_clase) {
    visible = true;
    active = true;
}

// Si todavía no está activo, no sigue
if (!active) exit;

// Si el diálogo acaba de cerrarse, espera antes de permitir otro
if (dialogo_cerrado) {
    if (!keyboard_check(ord("E"))) { // Espera que el jugador suelte la tecla E
        dialogo_cerrado = false;      // Ya puede volver a activar diálogo
    } else {
        exit; // Evita activar mientras siga presionada E
    }
}

// Verifica que el jugador esté cerca y presione "E"
if (distance_to_object(Obj_Player_M) < 40 && keyboard_check_pressed(ord("E")) && !global.dialogo_activo) {
    
	global.dialogo_activo = true;
	
    // Decidimos qué diálogo se debe mostrar
    if (!global.npc_1) {
        global.dialogo_id = 1; // primer diálogo con este NPC
        global.npc_1 = true;
    } else {
        global.dialogo_id = 2; // diálogo repetido
    }
	


    // Solo indica que hay que mostrar el textbox
    instance_create_layer(x, y - 32, "Instances", obj_text_box_general);
}
