global.dialogo_activo = false;
global.dialogo_id = 0;

// Señala al NPC que el diálogo se cerró (para evitar reactivación inmediata)
with (obj_npc_1) {
    dialogo_cerrado = true;
}

if (global.activar_mision_1) {
    global.mision_1 = true;
	global.mision_terminada = 1;
    instance_create_layer(0, 0, "UI", obj_mission_clear);
}

// Esto es porque al final despues de ver el objeto se tiene que hablar otra vez con el maestro
if (global.activar_mision_3) {
    global.mision_3 = true;
	global.mision_terminada = 3;
    instance_create_layer(0, 0, "UI", obj_mission_clear);
}

if (variable_instance_exists(id, "npc_ref")) {
    with (npc_ref) {
        dialogo_cerrado = true;
    }
}

