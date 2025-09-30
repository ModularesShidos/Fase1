global.dialogo_activo = false;

// Señala al NPC que el diálogo se cerró (para evitar reactivación inmediata)
with (obj_npc_1) {
    dialogo_cerrado = true;
}

if (global.dialogo_id == 3) {
	global.game_state = 1;
    instance_create_layer(0, 0, "UI", obj_mission_clear);
}
if (global.dialogo_id == 9) {
	global.game_state = 3;
    instance_create_layer(0, 0, "UI", obj_contacto_profe_aux);
}
if (global.dialogo_id == 12) {
	global.game_state = 4;
    instance_create_layer(0, 0, "UI", obj_mission_clear);
}

if (global.dialogo_id == 15) {
	audio_stop_sound(Snd_Cucei);
	room_goto(Sala_batalla);
}

if (variable_instance_exists(id, "npc_ref")) {
    with (npc_ref) {
        dialogo_cerrado = true;
    }
}

