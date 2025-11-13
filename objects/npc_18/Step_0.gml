// npc_1 - Step

// Solo activa el temporizador si la condición se cumple
if (global.game_state == 0 || global.game_state == 4) {
    instance_destroy();
    exit;
}


// Si no existe jugador, salir
if (!instance_exists(Obj_Player_M)) exit;

// Si ya hay diálogo global no hacer nada
if (global.dialogo_activo) exit;

if (dialogo_cerrado) {
    if (keyboard_check(ord("E"))) {
        // El jugador sigue con E no permitimos abrir hasta que la suelte
        exit;
    } else {
        // Ya la soltó permitimos hablar de nuevo
        dialogo_cerrado = false;
    }
}

if (distance_to_object(Obj_Player_M) < 40 && keyboard_check_pressed(ord("E"))) {

    if (instance_number(obj_text_box_npc) > 0) {
        exit;
    }

    global.dialogo_activo = true;
    dialogo_cerrado = true;

    var tb = instance_create_layer(x, y - 32, "UI", obj_text_box_npc);

    if (tb != noone) {
        tb.npc_ref = id;
    } else {
        global.dialogo_activo = false;
        dialogo_cerrado = false;
    }
}
