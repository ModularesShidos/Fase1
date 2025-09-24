// Solo activa el temporizador si la condición se cumple
if (global.game_state != 3) {
    if (destruir_timer == -1) {
        destruir_timer = 5 * 60; // 5 segundos
    } else {
        destruir_timer -= 1;
        if (destruir_timer <= 0) {
            instance_destroy();
            exit;
        }
    }
}

// Solo se activa si está la misión 3
if (!active && global.clase3_vista) {
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
	
    if (getItem(ITEM_FUNKO) != noone) {
        global.dialogo_id = 12; 
		global.game_state = 4;
        removeItem(ITEM_FUNKO);
    }
    else if (!global.npc_4) {
        global.dialogo_id = 10; 
        global.npc_4 = true; 
    }
    else {
        global.dialogo_id = 11; 
    }

    // Muestra el textbox
    var caja = instance_create_layer(x, y - 32, "Instances", obj_text_box_general);
    
    // Importante: cuando termine el diálogo, debe marcar que este NPC cerró
    with (caja) {
        npc_ref = other.id; // guarda referencia del npc que habló
    }
}
