// obj_text_box_npc - Destroy

// Liberar diálogo global
global.dialogo_activo = false;

// Si tenemos referencia al NPC, notifícalo para que espere la soltar de E
if (variable_instance_exists(id, "npc_ref")) {
    if (instance_exists(npc_ref)) {
        with (npc_ref) {
            dialogo_cerrado = true;
            show_debug_message("🔄 NPC notificado: diálogo cerrado (esperar soltar E)");
        }
    }
}
