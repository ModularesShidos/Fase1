// npc_1 - Step

// Protección: si no existe jugador, salir
if (!instance_exists(Obj_Player_M)) exit;

// Si ya hay diálogo global, no hagas nada
if (global.dialogo_activo) exit;

// Si el NPC está marcado como que acabó diálogo y el jugador aún mantiene E,
// espera hasta que la suelte.
if (dialogo_cerrado) {
    if (keyboard_check(ord("E"))) {
        // El jugador sigue con E: no permitimos abrir hasta que la suelte
        exit;
    } else {
        // Ya la soltó, permitimos hablar de nuevo
        dialogo_cerrado = false;
    }
}

// Si el jugador está cerca y presiona E, intenta crear textbox
if (distance_to_object(Obj_Player_M) < 40 && keyboard_check_pressed(ord("E"))) {

    // Seguridad extra: si ya existe algún textbox de este tipo, no crear otro
    if (instance_number(obj_text_box_npc) > 0) {
        show_debug_message("⚠️ Ya existe obj_text_box_npc activo, no se creará otro.");
        exit;
    }

    show_debug_message("🎯 NPC: Creando textbox aleatorio");

    // Bloqueamos dialogo global e indicamos que el NPC ya habló/está cerrado
    global.dialogo_activo = true;
    dialogo_cerrado = true;

    // Crear el textbox en la capa GUI (cambiar "GUI" si usas otra layer)
    var tb = instance_create_layer(x, y - 32, "UI", obj_text_box_npc);

    // Guardar referencia al NPC dentro del textbox para notificar al destruir
    if (tb != noone) {
        tb.npc_ref = id;
    } else {
        // Por si algo falla: liberar
        global.dialogo_activo = false;
        dialogo_cerrado = false;
        show_debug_message("❌ Falló la creación del textbox.");
    }
}
