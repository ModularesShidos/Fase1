show_debug_message("Textbox destruido");
global.dialogo_activo = false;
global.dialogo_id = 0;

// Señala al NPC que el diálogo se cerró (para evitar reactivación inmediata)
with (obj_npc_1) {
    dialogo_cerrado = true;
}

