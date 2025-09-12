global.dialogo_activo = false;

// Señala al NPC que el diálogo se cerró (para evitar reactivación inmediata)
with (obj_npc_1) {
    dialogo_cerrado = true;
}

if (global.dialogo_id = 3) {
    instance_create_layer(0, 0, "UI", obj_mission_clear);
}
if (global.dialogo_id = 9) {
    instance_create_layer(0, 0, "UI", obj_mission_clear);
}
if (global.dialogo_id = 12) {
    instance_create_layer(0, 0, "UI", obj_mission_clear);
}


if (variable_instance_exists(id, "npc_ref")) {
    with (npc_ref) {
        dialogo_cerrado = true;
    }
}
