
global.dialogo_activo = false;

if (global.mission_clear_aux){
	instance_create_layer(0, 0, "UI", obj_mission_clear);
}

if (global.is_contra == true) {
    global.is_contra = false; // Reseteamos para que no se repita
}

if (global.fuentes_cont == 3){
	instance_create_layer(0, 0, "UI", obj_mission_clear);
}