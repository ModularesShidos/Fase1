// Si la misión 3 no está activa, este NPC no existe todavía

if (global.game_state != 4) {
    instance_destroy();
    exit;
} 

// Solo se activa si está la misión 3
if (!active && global.clase5_vista) {
    visible = true;
    active = true;
}

// Si todavía no está activo, no sigue
if (!active) exit;

// Si el diálogo acaba de cerrarse, espera antes de permitir otro
if (dialogo_cerrado) {
    if (!keyboard_check(ord("E"))) { 
        dialogo_cerrado = false; // Ya puede volver a activar diálogo
    } else {
        exit; 
    }
}

// Verifica que el jugador esté cerca y presione "E"
if (distance_to_object(Obj_Player_M) < 40 && keyboard_check_pressed(ord("E")) && !global.dialogo_activo) {
    
    global.dialogo_activo = true;
	
	// CHECAR ESTO PORQUE SE MUESTRA EL DIALOGO 14
	
    if (!global.npc_5) {
        global.dialogo_id = 13; 
        global.npc_5 = true; 
    } 
    // Las siguientes veces
    else {
        global.dialogo_id = 14; 
    }

    // Muestra el textbox
    var caja = instance_create_layer(x, y - 32, "Instances", obj_text_box_general);
    
    // Importante: cuando termine el diálogo, debe marcar que este NPC cerró
    with (caja) {
        npc_ref = other.id; // guarda referencia del npc que habló
    }
}
