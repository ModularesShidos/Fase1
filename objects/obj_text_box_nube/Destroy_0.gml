// Destruir 
global.dialogo_activo = false;

if (global.mission_clear_aux){
	instance_create_layer(0, 0, "UI", obj_mission_clear);
	instance_destroy();
	return;
}


if (global.is_contra) {
    global.is_contra = false; // Reseteamos para que no se repita
	instance_destroy();
	return;
}


if (global.fuentes_cont == 1 || global.fuentes_cont == 2){
	instance_destroy();
	return;
}

if (global.fuentes_cont == 3){
	instance_create_layer(0, 0, "UI", obj_mission_clear);
	return;
}

// DESPUÉS de mostrar lo que aprendiste, preguntar si le gustó
if (global.class_state >= 0 && global.class_state <= 4) {
	
	instance_create_layer(0, 0, "UI", obj_val_clase);
	return;
	
}




