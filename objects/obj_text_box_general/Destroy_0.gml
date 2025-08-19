global.dialogo_activo = false;
global.dialogo_id = 0;

// Señala al NPC que el diálogo se cerró (para evitar reactivación inmediata)
with (obj_npc_1) {
    dialogo_cerrado = true;
}

if (global.activar_mision_1) {
    global.mision_1 = true;
    instance_create_layer(0, 0, "UI", obj_mission_clear);
}

